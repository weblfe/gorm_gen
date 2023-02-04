
// I{{.ModelStructName}}Do interface
type I{{.ModelStructName}}Do interface {
	gen.SubQuery
	Debug() I{{.ModelStructName}}Do
	WithContext(ctx context.Context) I{{.ModelStructName}}Do
	WithResult(fc func(tx gen.Dao)) gen.ResultInfo
	ReplaceDB(db *gorm.DB)
	ReadDB() I{{.ModelStructName}}Do
	WriteDB() I{{.ModelStructName}}Do
	As(alias string) gen.Dao
	Session(config *gorm.Session) I{{.ModelStructName}}Do
	Columns(cols ...field.Expr) gen.Columns
	Clauses(conditions ...clause.Expression) I{{.ModelStructName}}Do
	Not(conditions ...gen.Condition) I{{.ModelStructName}}Do
	Or(conditions ...gen.Condition) I{{.ModelStructName}}Do
	Select(conditions ...field.Expr) I{{.ModelStructName}}Do
	Where(conditions ...gen.Condition) I{{.ModelStructName}}Do
	Order(conditions ...field.Expr) I{{.ModelStructName}}Do
	Distinct(cols ...field.Expr) I{{.ModelStructName}}Do
	Omit(cols ...field.Expr) I{{.ModelStructName}}Do
	Join(table schema.Tabler, on ...field.Expr) I{{.ModelStructName}}Do
	LeftJoin(table schema.Tabler, on ...field.Expr) I{{.ModelStructName}}Do
	RightJoin(table schema.Tabler, on ...field.Expr) I{{.ModelStructName}}Do
	Group(cols ...field.Expr) I{{.ModelStructName}}Do
	Having(conditions ...gen.Condition) I{{.ModelStructName}}Do
	Limit(limit int) I{{.ModelStructName}}Do
	Offset(offset int) I{{.ModelStructName}}Do
	Count() (count int64, err error)
	Scopes(funcs ...func(gen.Dao) gen.Dao) I{{.ModelStructName}}Do
	Unscoped() I{{.ModelStructName}}Do
	Create(values ...*{{.StructInfo.Package}}.{{.StructInfo.Type}}) error
	CreateInBatches(values []*{{.StructInfo.Package}}.{{.StructInfo.Type}}, batchSize int) error
	Save(values ...*{{.StructInfo.Package}}.{{.StructInfo.Type}}) error
	First() (*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error)
	Take() (*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error)
	Last() (*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error)
	Find() ([]*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error)
	FindInBatch(batchSize int, fc func(tx gen.Dao, batch int) error) (results []*{{.StructInfo.Package}}.{{.StructInfo.Type}}, err error)
	FindInBatches(result *[]*{{.StructInfo.Package}}.{{.StructInfo.Type}}, batchSize int, fc func(tx gen.Dao, batch int) error) error
	Pluck(column field.Expr, dest interface{}) error
	Delete(...*{{.StructInfo.Package}}.{{.StructInfo.Type}}) (info gen.ResultInfo, err error)
	Update(column field.Expr, value interface{}) (info gen.ResultInfo, err error)
	UpdateSimple(columns ...field.AssignExpr) (info gen.ResultInfo, err error)
	Updates(value interface{}) (info gen.ResultInfo, err error)
	UpdateColumn(column field.Expr, value interface{}) (info gen.ResultInfo, err error)
	UpdateColumnSimple(columns ...field.AssignExpr) (info gen.ResultInfo, err error)
	UpdateColumns(value interface{}) (info gen.ResultInfo, err error)
	UpdateFrom(q gen.SubQuery) gen.Dao
	Attrs(attrs ...field.AssignExpr) I{{.ModelStructName}}Do
	Assign(attrs ...field.AssignExpr) I{{.ModelStructName}}Do
	Joins(fields ...field.RelationField) I{{.ModelStructName}}Do
	Preload(fields ...field.RelationField) I{{.ModelStructName}}Do
	FirstOrInit() (*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error)
	FirstOrCreate() (*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error)
	FindByPage(offset int, limit int) (result []*{{.StructInfo.Package}}.{{.StructInfo.Type}}, count int64, err error)
	ScanByPage(result interface{}, offset int, limit int) (count int64, err error)
	Scan(result interface{}) (err error)
	Returning(value interface{}, columns ...string) I{{.ModelStructName}}Do
	UnderlyingDB() *gorm.DB
	schema.Tabler

	{{range .Interfaces -}}
	{{.FuncSign}}
	{{end}}
}