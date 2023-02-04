
func ({{.S}} {{.QueryStructName}}Do) Debug() {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Debug())
}

func ({{.S}} {{.QueryStructName}}Do) WithContext(ctx context.Context) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.WithContext(ctx))
}

func ({{.S}} {{.QueryStructName}}Do) ReadDB() {{.ReturnObject}} {
	return {{.S}}.Clauses(dbresolver.Read)
}

func ({{.S}} {{.QueryStructName}}Do) WriteDB() {{.ReturnObject}} {
	return {{.S}}.Clauses(dbresolver.Write)
}

func ({{.S}} {{.QueryStructName}}Do) Session(config *gorm.Session) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Session(config))
}

func ({{.S}} {{.QueryStructName}}Do) Clauses(conds ...clause.Expression) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Clauses(conds...))
}

func ({{.S}} {{.QueryStructName}}Do) Returning(value interface{}, columns ...string) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Returning(value, columns...))
}

func ({{.S}} {{.QueryStructName}}Do) Not(conds ...gen.Condition) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Not(conds...))
}

func ({{.S}} {{.QueryStructName}}Do) Or(conds ...gen.Condition) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Or(conds...))
}

func ({{.S}} {{.QueryStructName}}Do) Select(conds ...field.Expr) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Select(conds...))
}

func ({{.S}} {{.QueryStructName}}Do) Where(conds ...gen.Condition) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Where(conds...))
}

func ({{.S}} {{.QueryStructName}}Do) Exists(subquery interface{UnderlyingDB() *gorm.DB}) {{.ReturnObject}} {
	return {{.S}}.Where(field.CompareSubQuery(field.ExistsOp, nil, subquery.UnderlyingDB()))
}

func ({{.S}} {{.QueryStructName}}Do) Order(conds ...field.Expr) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Order(conds...))
}

func ({{.S}} {{.QueryStructName}}Do) Distinct(cols ...field.Expr) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Distinct(cols...))
}

func ({{.S}} {{.QueryStructName}}Do) Omit(cols ...field.Expr) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Omit(cols...))
}

func ({{.S}} {{.QueryStructName}}Do) Join(table schema.Tabler, on ...field.Expr) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Join(table, on...))
}

func ({{.S}} {{.QueryStructName}}Do) LeftJoin(table schema.Tabler, on ...field.Expr) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.LeftJoin(table, on...))
}

func ({{.S}} {{.QueryStructName}}Do) RightJoin(table schema.Tabler, on ...field.Expr) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.RightJoin(table, on...))
}

func ({{.S}} {{.QueryStructName}}Do) Group(cols ...field.Expr) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Group(cols...))
}

func ({{.S}} {{.QueryStructName}}Do) Having(conds ...gen.Condition) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Having(conds...))
}

func ({{.S}} {{.QueryStructName}}Do) Limit(limit int) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Limit(limit))
}

func ({{.S}} {{.QueryStructName}}Do) Offset(offset int) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Offset(offset))
}

func ({{.S}} {{.QueryStructName}}Do) Scopes(funcs ...func(gen.Dao) gen.Dao) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Scopes(funcs...))
}

func ({{.S}} {{.QueryStructName}}Do) Unscoped() {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Unscoped())
}

func ({{.S}} {{.QueryStructName}}Do) Create(values ...*{{.StructInfo.Package}}.{{.StructInfo.Type}}) error {
	if len(values) == 0 {
		return nil
	}
	return {{.S}}.DO.Create(values)
}

func ({{.S}} {{.QueryStructName}}Do) CreateInBatches(values []*{{.StructInfo.Package}}.{{.StructInfo.Type}}, batchSize int) error {
	return {{.S}}.DO.CreateInBatches(values, batchSize)
}

// Save : !!! underlying implementation is different with GORM
// The method is equivalent to executing the statement: db.Clauses(clause.OnConflict{UpdateAll: true}).Create(values)
func ({{.S}} {{.QueryStructName}}Do) Save(values ...*{{.StructInfo.Package}}.{{.StructInfo.Type}}) error {
	if len(values) == 0 {
		return nil
	}
	return {{.S}}.DO.Save(values)
}

func ({{.S}} {{.QueryStructName}}Do) First() (*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error) {
	if result, err := {{.S}}.DO.First(); err != nil {
		return nil, err
	} else {
		return result.(*{{.StructInfo.Package}}.{{.StructInfo.Type}}), nil
	}
}

func ({{.S}} {{.QueryStructName}}Do) Take() (*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error) {
	if result, err := {{.S}}.DO.Take(); err != nil {
		return nil, err
	} else {
		return result.(*{{.StructInfo.Package}}.{{.StructInfo.Type}}), nil
	}
}

func ({{.S}} {{.QueryStructName}}Do) Last() (*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error) {
	if result, err := {{.S}}.DO.Last(); err != nil {
		return nil, err
	} else {
		return result.(*{{.StructInfo.Package}}.{{.StructInfo.Type}}), nil
	}
}

func ({{.S}} {{.QueryStructName}}Do) Find() ([]*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error) {
	result, err := {{.S}}.DO.Find()
	return result.([]*{{.StructInfo.Package}}.{{.StructInfo.Type}}), err
}

func ({{.S}} {{.QueryStructName}}Do) FindInBatch(batchSize int, fc func(tx gen.Dao, batch int) error) (results []*{{.StructInfo.Package}}.{{.StructInfo.Type}}, err error) {
	buf := make([]*{{.StructInfo.Package}}.{{.StructInfo.Type}}, 0, batchSize)
	err = {{.S}}.DO.FindInBatches(&buf, batchSize, func(tx gen.Dao, batch int) error {
		defer func() { results = append(results, buf...) }()
		return fc(tx, batch)
	})
	return results, err
}

func ({{.S}} {{.QueryStructName}}Do) FindInBatches(result *[]*{{.StructInfo.Package}}.{{.StructInfo.Type}}, batchSize int, fc func(tx gen.Dao, batch int) error) error {
	return {{.S}}.DO.FindInBatches(result, batchSize, fc)
}

func ({{.S}} {{.QueryStructName}}Do) Attrs(attrs ...field.AssignExpr) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Attrs(attrs...))
}

func ({{.S}} {{.QueryStructName}}Do) Assign(attrs ...field.AssignExpr) {{.ReturnObject}} {
	return {{.S}}.withDO({{.S}}.DO.Assign(attrs...))
}

func ({{.S}} {{.QueryStructName}}Do) Joins(fields ...field.RelationField) {{.ReturnObject}} {
	for _, _f := range fields {
        {{.S}} = *{{.S}}.withDO({{.S}}.DO.Joins(_f))
    }
	return &{{.S}}
}

func ({{.S}} {{.QueryStructName}}Do) Preload(fields ...field.RelationField) {{.ReturnObject}} {
    for _, _f := range fields {
        {{.S}} = *{{.S}}.withDO({{.S}}.DO.Preload(_f))
    }
	return &{{.S}}
}

func ({{.S}} {{.QueryStructName}}Do) FirstOrInit() (*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error) {
	if result, err := {{.S}}.DO.FirstOrInit(); err != nil {
		return nil, err
	} else {
		return result.(*{{.StructInfo.Package}}.{{.StructInfo.Type}}), nil
	}
}

func ({{.S}} {{.QueryStructName}}Do) FirstOrCreate() (*{{.StructInfo.Package}}.{{.StructInfo.Type}}, error) {
	if result, err := {{.S}}.DO.FirstOrCreate(); err != nil {
		return nil, err
	} else {
		return result.(*{{.StructInfo.Package}}.{{.StructInfo.Type}}), nil
	}
}

func ({{.S}} {{.QueryStructName}}Do) FindByPage(offset int, limit int) (result []*{{.StructInfo.Package}}.{{.StructInfo.Type}}, count int64, err error) {
	result, err = {{.S}}.Offset(offset).Limit(limit).Find()
	if err != nil{
		return
	}

	if size := len(result); 0 < limit && 0 < size && size < limit {
		count = int64(size+offset)
		return
	}

	count, err = {{.S}}.Offset(-1).Limit(-1).Count()
	return
}

func ({{.S}} {{.QueryStructName}}Do) ScanByPage(result interface{}, offset int, limit int) (count int64, err error) {
	count, err = {{.S}}.Count()
	if err != nil {
		return
	}

	err = {{.S}}.Offset(offset).Limit(limit).Scan(result)
	return
}

func ({{.S}} {{.QueryStructName}}Do) Scan(result interface{}) (err error) {
	return {{.S}}.DO.Scan(result)
}

func ({{.S}} {{.QueryStructName}}Do) Delete(models ...*{{.StructInfo.Package}}.{{.StructInfo.Type}}) (result gen.ResultInfo, err error) {
	return {{.S}}.DO.Delete(models)
}

func ({{.S}} *{{.QueryStructName}}Do) withDO(do gen.Dao) (*{{.QueryStructName}}Do) {
	{{.S}}.DO = *do.(*gen.DO)
	return {{.S}}
}

