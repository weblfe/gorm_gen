
func Use(db *gorm.DB, opts ...gen.DOOption) *Query {
	return &Query{
		db: db,
		{{range $name,$d :=.Data -}}
		{{$d.ModelStructName}}: new{{$d.ModelStructName}}(db,opts...),
		{{end -}}
	}
}

type Query struct{
	db *gorm.DB

	{{range $name,$d :=.Data -}}
	{{$d.ModelStructName}} {{$d.QueryStructName}}
	{{end}}
}

func (q *Query) Available() bool { return q.db != nil }

func (q *Query) clone(db *gorm.DB) *Query {
	return &Query{
		db: db,
		{{range $name,$d :=.Data -}}
		{{$d.ModelStructName}}: q.{{$d.ModelStructName}}.clone(db),
		{{end}}
	}
}

func (q *Query) ReadDB() *Query {
	return q.ReplaceDB(q.db.Clauses(dbresolver.Read))
}

func (q *Query) WriteDB() *Query {
	return q.ReplaceDB(q.db.Clauses(dbresolver.Write))
}

func (q *Query) ReplaceDB(db *gorm.DB) *Query {
	return &Query{
		db: db,
		{{range $name,$d :=.Data -}}
		{{$d.ModelStructName}}: q.{{$d.ModelStructName}}.replaceDB(db),
		{{end}}
	}
}

type queryCtx struct{
	{{range $name,$d :=.Data -}}
	{{$d.ModelStructName}} {{$d.ReturnObject}}
	{{end}}
}

func (q *Query) WithContext(ctx context.Context) *queryCtx  {
	return &queryCtx{
		{{range $name,$d :=.Data -}}
		{{$d.ModelStructName}}: q.{{$d.ModelStructName}}.WithContext(ctx),
		{{end}}
	}
}

func (q *Query) Transaction(fc func(tx *Query) error, opts ...*sql.TxOptions) error {
	return q.db.Transaction(func(tx *gorm.DB) error { return fc(q.clone(tx)) }, opts...)
}

func (q *Query) Begin(opts ...*sql.TxOptions) *QueryTx {
	return &QueryTx{q.clone(q.db.Begin(opts...))}
}

type QueryTx struct{ *Query }

func (q *QueryTx) Commit() error {
	return q.db.Commit().Error
}

func (q *QueryTx) Rollback() error {
	return q.db.Rollback().Error
}

func (q *QueryTx) SavePoint(name string) error {
	return q.db.SavePoint(name).Error
}

func (q *QueryTx) RollbackTo(name string) error {
	return q.db.RollbackTo(name).Error
}

