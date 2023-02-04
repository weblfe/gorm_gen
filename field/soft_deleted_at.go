package field

import (
		"gorm.io/gorm/clause"
		"gorm.io/plugin/soft_delete"
)

type SoftDeletedAt Uint

// Eq equal to
func (field SoftDeletedAt) Eq(value soft_delete.DeletedAt) Expr {
		return expr{e: clause.Eq{Column: field.RawExpr(), Value: value}}
}

// Neq not equal to
func (field SoftDeletedAt) Neq(value soft_delete.DeletedAt) Expr {
		return expr{e: clause.Neq{Column: field.RawExpr(), Value: value}}
}

// Gt greater than
func (field SoftDeletedAt) Gt(value soft_delete.DeletedAt) Expr {
		return expr{e: clause.Gt{Column: field.RawExpr(), Value: value}}
}

// Gte greater or equal to
func (field SoftDeletedAt) Gte(value soft_delete.DeletedAt) Expr {
		return expr{e: clause.Gte{Column: field.RawExpr(), Value: value}}
}

// Lt less than
func (field SoftDeletedAt) Lt(value soft_delete.DeletedAt) Expr {
		return expr{e: clause.Lt{Column: field.RawExpr(), Value: value}}
}

// Lte less or equal to
func (field SoftDeletedAt) Lte(value soft_delete.DeletedAt) Expr {
		return expr{e: clause.Lte{Column: field.RawExpr(), Value: value}}
}

// In ...
func (field SoftDeletedAt) In(values ...soft_delete.DeletedAt) Expr {
		return expr{e: clause.IN{Column: field.RawExpr(), Values: field.toSlice(values...)}}
}

// NotIn ...
func (field SoftDeletedAt) NotIn(values ...soft_delete.DeletedAt) Expr {
		return expr{e: clause.Not(field.In(values...).expression())}
}

// Between ...
func (field SoftDeletedAt) Between(left , right soft_delete.DeletedAt) Expr {
		return field.between([]interface{}{left, right})
}

// NotBetween ...
func (field SoftDeletedAt) NotBetween(left , right soft_delete.DeletedAt) Expr {
		return Not(field.Between(left, right))
}

// Like ...
func (field SoftDeletedAt) Like(value soft_delete.DeletedAt) Expr {
		return expr{e: clause.Like{Column: field.RawExpr(), Value: value}}
}

// NotLike ...
func (field SoftDeletedAt) NotLike(value soft_delete.DeletedAt) Expr {
		return expr{e: clause.Not(field.Like(value).expression())}
}

// Add ...
func (field SoftDeletedAt) Add(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.add(value)}
}

// Sub ...
func (field SoftDeletedAt) Sub(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.sub(value)}
}

// Mul ...
func (field SoftDeletedAt) Mul(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.mul(value)}
}

// Div ...
func (field SoftDeletedAt) Div(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.div(value)}
}

// Mod ...
func (field SoftDeletedAt) Mod(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.mod(value)}
}

// FloorDiv ...
func (field SoftDeletedAt) FloorDiv(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.floorDiv(value)}
}

// RightShift ...
func (field SoftDeletedAt) RightShift(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.rightShift(value)}
}

// LeftShift ...
func (field SoftDeletedAt) LeftShift(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.leftShift(value)}
}

// BitXor ...
func (field SoftDeletedAt) BitXor(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.bitXor(value)}
}

// BitAnd ...
func (field SoftDeletedAt) BitAnd(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.bitAnd(value)}
}

// BitOr ...
func (field SoftDeletedAt) BitOr(value soft_delete.DeletedAt) SoftDeletedAt {
		return SoftDeletedAt{field.bitOr(value)}
}

// BitFlip ...
func (field SoftDeletedAt) BitFlip() SoftDeletedAt {
		return SoftDeletedAt{field.bitFlip()}
}

// Value set value
func (field SoftDeletedAt) Value(value soft_delete.DeletedAt) AssignExpr {
		return field.value(value)
}

// Zero set zero value
func (field SoftDeletedAt) Zero() AssignExpr {
		return field.value(0)
}

// Sum ...
func (field SoftDeletedAt) Sum() SoftDeletedAt {
		return SoftDeletedAt{field.sum()}
}

// IfNull ...
func (field SoftDeletedAt) IfNull(value soft_delete.DeletedAt) Expr {
		return field.ifNull(value)
}

func (field SoftDeletedAt) toSlice(values ...soft_delete.DeletedAt) []interface{} {
		slice := make([]interface{}, len(values))
		for i, v := range values {
				slice[i] = v
		}
		return slice
}
