package gen

import (
	"fmt"

	"github.com/weblfe/gorm_gen/field"
	"gorm.io/datatypes"
	"gorm.io/gorm/clause"
)

// Cond convert expression array to condition array
func Cond(expressions ...clause.Expression) []Condition {
	return exprToCondition(expressions...)
}

var _ Condition = &condContainer{}

type condContainer struct {
	value interface{}
	err   error
}

func (c *condContainer) BeCond() interface{} { return c.value }
func (c *condContainer) CondError() error    { return c.err }

func exprToCondition(expressions ...clause.Expression) []Condition {
	conditions := make([]Condition, 0, len(expressions))
	for _, e := range expressions {
		switch e := e.(type) {
		case *datatypes.JSONQueryExpression, *datatypes.JSONOverlapsExpression:
			conditions = append(conditions, &condContainer{value: e})
		default:
			conditions = append(conditions, &condContainer{err: fmt.Errorf("unsupported Expression %T to converted to Condition", e)})
		}
	}
	return conditions
}

func condToExpression(conditions []Condition) ([]clause.Expression, error) {
	if len(conditions) == 0 {
		return nil, nil
	}
	expressions := make([]clause.Expression, 0, len(conditions))
	for _, cond := range conditions {
		if cond == nil {
			continue
		}
		if err := cond.CondError(); err != nil {
			return nil, err
		}

		switch cond.(type) {
		case *condContainer, field.Expr, SubQuery:
		default:
			return nil, fmt.Errorf("unsupported condition: %+v", cond)
		}

		switch e := cond.BeCond().(type) {
		case []clause.Expression:
			expressions = append(expressions, e...)
		case clause.Expression:
			expressions = append(expressions, e)
		}
	}
	return expressions, nil
}
