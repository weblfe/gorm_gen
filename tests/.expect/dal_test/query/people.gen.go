// Code generated by github.com/weblfe/gorm_gen. DO NOT EDIT.
// Code generated by github.com/weblfe/gorm_gen. DO NOT EDIT.
// Code generated by github.com/weblfe/gorm_gen. DO NOT EDIT.

package query

import (
	"context"

	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"gorm.io/gorm/schema"

	"github.com/weblfe/gorm_gen"
	"github.com/weblfe/gorm_gen/field"

	"gorm.io/plugin/dbresolver"

	"github.com/weblfe/gorm_gen/tests/.expect/dal_test/model"
)

func newPerson(db *gorm.DB) person {
	_person := person{}

	_person.personDo.UseDB(db)
	_person.personDo.UseModel(&model.Person{})

	tableName := _person.personDo.TableName()
	_person.ALL = field.NewAsterisk(tableName)
	_person.ID = field.NewInt64(tableName, "id")
	_person.Name = field.NewString(tableName, "name")
	_person.Age = field.NewInt32(tableName, "age")
	_person.Flag = field.NewBool(tableName, "flag")
	_person.AnotherFlag = field.NewInt32(tableName, "another_flag")
	_person.Commit = field.NewString(tableName, "commit")
	_person.First = field.NewBool(tableName, "First")
	_person.Bit = field.NewField(tableName, "bit")
	_person.Small = field.NewInt32(tableName, "small")
	_person.DeletedAt = field.NewField(tableName, "deleted_at")
	_person.Score = field.NewFloat64(tableName, "score")
	_person.Number = field.NewInt32(tableName, "number")
	_person.Birth = field.NewTime(tableName, "birth")
	_person.XMLHTTPRequest = field.NewString(tableName, "xmlHTTPRequest")
	_person.JStr = field.NewString(tableName, "jStr")
	_person.Geo = field.NewString(tableName, "geo")
	_person.Mint = field.NewInt32(tableName, "mint")
	_person.Blank = field.NewString(tableName, "blank")
	_person.Remark = field.NewString(tableName, "remark")
	_person.LongRemark = field.NewString(tableName, "long_remark")

	_person.fillFieldMap()

	return _person
}

type person struct {
	personDo personDo

	ALL            field.Asterisk
	ID             field.Int64
	Name           field.String
	Age            field.Int32
	Flag           field.Bool
	AnotherFlag    field.Int32
	Commit         field.String
	First          field.Bool
	Bit            field.Field
	Small          field.Int32
	DeletedAt      field.Field
	Score          field.Float64
	Number         field.Int32
	Birth          field.Time
	XMLHTTPRequest field.String
	JStr           field.String
	Geo            field.String
	Mint           field.Int32
	Blank          field.String
	Remark         field.String
	LongRemark     field.String

	fieldMap map[string]field.Expr
}

func (p person) Table(newTableName string) *person {
	p.personDo.UseTable(newTableName)
	return p.updateTableName(newTableName)
}

func (p person) As(alias string) *person {
	p.personDo.DO = *(p.personDo.As(alias).(*gen.DO))
	return p.updateTableName(alias)
}

func (p *person) updateTableName(table string) *person {
	p.ALL = field.NewAsterisk(table)
	p.ID = field.NewInt64(table, "id")
	p.Name = field.NewString(table, "name")
	p.Age = field.NewInt32(table, "age")
	p.Flag = field.NewBool(table, "flag")
	p.AnotherFlag = field.NewInt32(table, "another_flag")
	p.Commit = field.NewString(table, "commit")
	p.First = field.NewBool(table, "First")
	p.Bit = field.NewField(table, "bit")
	p.Small = field.NewInt32(table, "small")
	p.DeletedAt = field.NewField(table, "deleted_at")
	p.Score = field.NewFloat64(table, "score")
	p.Number = field.NewInt32(table, "number")
	p.Birth = field.NewTime(table, "birth")
	p.XMLHTTPRequest = field.NewString(table, "xmlHTTPRequest")
	p.JStr = field.NewString(table, "jStr")
	p.Geo = field.NewString(table, "geo")
	p.Mint = field.NewInt32(table, "mint")
	p.Blank = field.NewString(table, "blank")
	p.Remark = field.NewString(table, "remark")
	p.LongRemark = field.NewString(table, "long_remark")

	p.fillFieldMap()

	return p
}

func (p *person) WithContext(ctx context.Context) *personDo { return p.personDo.WithContext(ctx) }

func (p person) TableName() string { return p.personDo.TableName() }

func (p person) Alias() string { return p.personDo.Alias() }

func (p *person) GetFieldByName(fieldName string) (field.OrderExpr, bool) {
	_f, ok := p.fieldMap[fieldName]
	if !ok || _f == nil {
		return nil, false
	}
	_oe, ok := _f.(field.OrderExpr)
	return _oe, ok
}

func (p *person) fillFieldMap() {
	p.fieldMap = make(map[string]field.Expr, 20)
	p.fieldMap["id"] = p.ID
	p.fieldMap["name"] = p.Name
	p.fieldMap["age"] = p.Age
	p.fieldMap["flag"] = p.Flag
	p.fieldMap["another_flag"] = p.AnotherFlag
	p.fieldMap["commit"] = p.Commit
	p.fieldMap["First"] = p.First
	p.fieldMap["bit"] = p.Bit
	p.fieldMap["small"] = p.Small
	p.fieldMap["deleted_at"] = p.DeletedAt
	p.fieldMap["score"] = p.Score
	p.fieldMap["number"] = p.Number
	p.fieldMap["birth"] = p.Birth
	p.fieldMap["xmlHTTPRequest"] = p.XMLHTTPRequest
	p.fieldMap["jStr"] = p.JStr
	p.fieldMap["geo"] = p.Geo
	p.fieldMap["mint"] = p.Mint
	p.fieldMap["blank"] = p.Blank
	p.fieldMap["remark"] = p.Remark
	p.fieldMap["long_remark"] = p.LongRemark
}

func (p person) clone(db *gorm.DB) person {
	p.personDo.ReplaceDB(db)
	return p
}

type personDo struct{ gen.DO }

func (p personDo) Debug() *personDo {
	return p.withDO(p.DO.Debug())
}

func (p personDo) WithContext(ctx context.Context) *personDo {
	return p.withDO(p.DO.WithContext(ctx))
}

func (p personDo) ReadDB() *personDo {
	return p.Clauses(dbresolver.Read)
}

func (p personDo) WriteDB() *personDo {
	return p.Clauses(dbresolver.Write)
}

func (p personDo) Clauses(conds ...clause.Expression) *personDo {
	return p.withDO(p.DO.Clauses(conds...))
}

func (p personDo) Returning(value interface{}, columns ...string) *personDo {
	return p.withDO(p.DO.Returning(value, columns...))
}

func (p personDo) Not(conds ...gen.Condition) *personDo {
	return p.withDO(p.DO.Not(conds...))
}

func (p personDo) Or(conds ...gen.Condition) *personDo {
	return p.withDO(p.DO.Or(conds...))
}

func (p personDo) Select(conds ...field.Expr) *personDo {
	return p.withDO(p.DO.Select(conds...))
}

func (p personDo) Where(conds ...gen.Condition) *personDo {
	return p.withDO(p.DO.Where(conds...))
}

func (p personDo) Exists(subquery interface{ UnderlyingDB() *gorm.DB }) *personDo {
	return p.Where(field.CompareSubQuery(field.ExistsOp, nil, subquery.UnderlyingDB()))
}

func (p personDo) Order(conds ...field.Expr) *personDo {
	return p.withDO(p.DO.Order(conds...))
}

func (p personDo) Distinct(cols ...field.Expr) *personDo {
	return p.withDO(p.DO.Distinct(cols...))
}

func (p personDo) Omit(cols ...field.Expr) *personDo {
	return p.withDO(p.DO.Omit(cols...))
}

func (p personDo) Join(table schema.Tabler, on ...field.Expr) *personDo {
	return p.withDO(p.DO.Join(table, on...))
}

func (p personDo) LeftJoin(table schema.Tabler, on ...field.Expr) *personDo {
	return p.withDO(p.DO.LeftJoin(table, on...))
}

func (p personDo) RightJoin(table schema.Tabler, on ...field.Expr) *personDo {
	return p.withDO(p.DO.RightJoin(table, on...))
}

func (p personDo) Group(cols ...field.Expr) *personDo {
	return p.withDO(p.DO.Group(cols...))
}

func (p personDo) Having(conds ...gen.Condition) *personDo {
	return p.withDO(p.DO.Having(conds...))
}

func (p personDo) Limit(limit int) *personDo {
	return p.withDO(p.DO.Limit(limit))
}

func (p personDo) Offset(offset int) *personDo {
	return p.withDO(p.DO.Offset(offset))
}

func (p personDo) Scopes(funcs ...func(gen.Dao) gen.Dao) *personDo {
	return p.withDO(p.DO.Scopes(funcs...))
}

func (p personDo) Unscoped() *personDo {
	return p.withDO(p.DO.Unscoped())
}

func (p personDo) Create(values ...*model.Person) error {
	if len(values) == 0 {
		return nil
	}
	return p.DO.Create(values)
}

func (p personDo) CreateInBatches(values []*model.Person, batchSize int) error {
	return p.DO.CreateInBatches(values, batchSize)
}

// Save : !!! underlying implementation is different with GORM
// The method is equivalent to executing the statement: db.Clauses(clause.OnConflict{UpdateAll: true}).Create(values)
func (p personDo) Save(values ...*model.Person) error {
	if len(values) == 0 {
		return nil
	}
	return p.DO.Save(values)
}

func (p personDo) First() (*model.Person, error) {
	if result, err := p.DO.First(); err != nil {
		return nil, err
	} else {
		return result.(*model.Person), nil
	}
}

func (p personDo) Take() (*model.Person, error) {
	if result, err := p.DO.Take(); err != nil {
		return nil, err
	} else {
		return result.(*model.Person), nil
	}
}

func (p personDo) Last() (*model.Person, error) {
	if result, err := p.DO.Last(); err != nil {
		return nil, err
	} else {
		return result.(*model.Person), nil
	}
}

func (p personDo) Find() ([]*model.Person, error) {
	result, err := p.DO.Find()
	return result.([]*model.Person), err
}

func (p personDo) FindInBatch(batchSize int, fc func(tx gen.Dao, batch int) error) (results []*model.Person, err error) {
	buf := make([]*model.Person, 0, batchSize)
	err = p.DO.FindInBatches(&buf, batchSize, func(tx gen.Dao, batch int) error {
		defer func() { results = append(results, buf...) }()
		return fc(tx, batch)
	})
	return results, err
}

func (p personDo) FindInBatches(result *[]*model.Person, batchSize int, fc func(tx gen.Dao, batch int) error) error {
	return p.DO.FindInBatches(result, batchSize, fc)
}

func (p personDo) Attrs(attrs ...field.AssignExpr) *personDo {
	return p.withDO(p.DO.Attrs(attrs...))
}

func (p personDo) Assign(attrs ...field.AssignExpr) *personDo {
	return p.withDO(p.DO.Assign(attrs...))
}

func (p personDo) Joins(fields ...field.RelationField) *personDo {
	for _, _f := range fields {
		p = *p.withDO(p.DO.Joins(_f))
	}
	return &p
}

func (p personDo) Preload(fields ...field.RelationField) *personDo {
	for _, _f := range fields {
		p = *p.withDO(p.DO.Preload(_f))
	}
	return &p
}

func (p personDo) FirstOrInit() (*model.Person, error) {
	if result, err := p.DO.FirstOrInit(); err != nil {
		return nil, err
	} else {
		return result.(*model.Person), nil
	}
}

func (p personDo) FirstOrCreate() (*model.Person, error) {
	if result, err := p.DO.FirstOrCreate(); err != nil {
		return nil, err
	} else {
		return result.(*model.Person), nil
	}
}

func (p personDo) FindByPage(offset int, limit int) (result []*model.Person, count int64, err error) {
	result, err = p.Offset(offset).Limit(limit).Find()
	if err != nil {
		return
	}

	if size := len(result); 0 < limit && 0 < size && size < limit {
		count = int64(size + offset)
		return
	}

	count, err = p.Offset(-1).Limit(-1).Count()
	return
}

func (p personDo) ScanByPage(result interface{}, offset int, limit int) (count int64, err error) {
	count, err = p.Count()
	if err != nil {
		return
	}

	err = p.Offset(offset).Limit(limit).Scan(result)
	return
}

func (p personDo) Scan(result interface{}) (err error) {
	return p.DO.Scan(result)
}

func (p personDo) Delete(models ...*model.Person) (result gen.ResultInfo, err error) {
	return p.DO.Delete(models)
}

func (p *personDo) withDO(do gen.Dao) *personDo {
	p.DO = *do.(*gen.DO)
	return p
}
