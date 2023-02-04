
// createMethod
func new{{.ModelStructName}}(db *gorm.DB, opts ...gen.DOOption) {{.QueryStructName}} {
		_{{.QueryStructName}} := {{.QueryStructName}}{}

		_{{.QueryStructName}}.{{.QueryStructName}}Do.UseDB(db,opts...)
		_{{.QueryStructName}}.{{.QueryStructName}}Do.UseModel(&{{.StructInfo.Package}}.{{.StructInfo.Type}}{})

		tableName := _{{.QueryStructName}}.{{.QueryStructName}}Do.TableName()
		_{{$.QueryStructName}}.ALL = field.NewAsterisk(tableName)
		{{range .Fields -}}
		{{if not .IsRelation -}}
			{{- if .ColumnName -}}_{{$.QueryStructName}}.{{.Name}} = field.New{{.GenType}}(tableName, "{{.ColumnName}}"){{- end -}}
		{{- else -}}
			_{{$.QueryStructName}}.{{.Relation.Name}} = {{$.QueryStructName}}{{.Relation.RelationshipName}}{{.Relation.Name}}{
				db: db.Session(&gorm.Session{}),

				{{.Relation.StructFieldInit}}
			}
		{{end}}
		{{end}}

		_{{$.QueryStructName}}.fillFieldMap()

		return _{{.QueryStructName}}
}


// {{.QueryStructName}} struct
type {{.QueryStructName}} struct {
		{{.QueryStructName}}Do
		ALL field.Asterisk
        	{{range .Fields -}}
        		{{if not .IsRelation -}}
        			{{if .MultilineComment -}}
        			/*
        {{.ColumnComment}}
            		*/
        			{{end -}}
        			{{- if .ColumnName -}}{{.Name}} field.{{.GenType}}{{if not .MultilineComment}}{{if .ColumnComment}}// {{.ColumnComment}}{{end}}{{end}}{{- end -}}
        		{{- else -}}
        			{{.Relation.Name}} {{$.QueryStructName}}{{.Relation.RelationshipName}}{{.Relation.Name}}
        		{{end}}
        	{{end}}
        fieldMap  map[string]field.Expr
}

// Table tableMethod
func ({{.S}} {{.QueryStructName}}) Table(newTableName string) *{{.QueryStructName}} {
	{{.S}}.{{.QueryStructName}}Do.UseTable(newTableName)
	return {{.S}}.updateTableName(newTableName)
}

// As asMethod
func ({{.S}} {{.QueryStructName}}) As(alias string) *{{.QueryStructName}} {
	{{.S}}.{{.QueryStructName}}Do.DO = *({{.S}}.{{.QueryStructName}}Do.As(alias).(*gen.DO))
	return {{.S}}.updateTableName(alias)
}

// updateMethod
func ({{.S}} *{{.QueryStructName}}) updateTableName(table string) *{{.QueryStructName}} {
	{{.S}}.ALL = field.NewAsterisk(table)
	{{range .Fields -}}
	{{if not .IsRelation -}}
		{{- if .ColumnName -}}{{$.S}}.{{.Name}} = field.New{{.GenType}}(table, "{{.ColumnName}}"){{- end -}}
	{{end}}
	{{end}}

	{{.S}}.fillFieldMap()

	return {{.S}}
}

// WithContext method
func ({{.S}} *{{.QueryStructName}}) WithContext(ctx context.Context) {{.ReturnObject}} {
    return {{.S}}.{{.QueryStructName}}Do.WithContext(ctx)
}

// TableName table name
func ({{.S}} {{.QueryStructName}}) TableName() string {
    return {{.S}}.{{.QueryStructName}}Do.TableName()
}

// Alias method
func ({{.S}} {{.QueryStructName}}) Alias() string {
    return {{.S}}.{{.QueryStructName}}Do.Alias()
}


// GetFieldByName getFieldMethod
func ({{.S}} *{{.QueryStructName}}) GetFieldByName(fieldName string) (field.OrderExpr, bool) {
	_f, ok := {{.S}}.fieldMap[fieldName]
	if !ok || _f == nil {
		return nil, false
	}
	_oe,ok := _f.(field.OrderExpr)
	return _oe,ok
}

// fillFieldMapMethod
func ({{.S}} *{{.QueryStructName}}) fillFieldMap() {
	{{.S}}.fieldMap =  make(map[string]field.Expr, {{len .Fields}})
	{{range .Fields -}}
	{{if not .IsRelation -}}
		{{- if .ColumnName -}}{{$.S}}.fieldMap["{{.ColumnName}}"] = {{$.S}}.{{.Name}}{{- end -}}
	{{end}}
	{{end -}}
}

// cloneMethod
func ({{.S}} {{.QueryStructName}}) clone(db *gorm.DB) {{.QueryStructName}} {
	{{.S}}.{{.QueryStructName}}Do.ReplaceConnPool(db.Statement.ConnPool)
	return {{.S}}
}

// replaceMethod
func ({{.S}} {{.QueryStructName}}) replaceDB(db *gorm.DB) {{.QueryStructName}} {
	{{.S}}.{{.QueryStructName}}Do.ReplaceDB(db)
	return {{.S}}
}

// relationship
{{range .Fields}}{{if .IsRelation}}{{- $relation := .Relation }}{{- $relationship := $relation.RelationshipName}}

// {{$.QueryStructName}}{{$relationship}}{{$relation.Name}} relationStruct
type {{$.QueryStructName}}{{$relationship}}{{$relation.Name}} struct{
	db *gorm.DB

	field.RelationField

	{{$relation.StructField}}
}

func (a {{$.QueryStructName}}{{$relationship}}{{$relation.Name}}) Where(conditions ...field.Expr) *{{$.QueryStructName}}{{$relationship}}{{$relation.Name}} {
	if len(conditions) == 0 {
		return &a
	}

	exprs := make([]clause.Expression, 0, len(conditions))
	for _, cond := range conditions {
		expressions = append(expressions, cond.BeCond().(clause.Expression))
	}
	a.db = a.db.Clauses(clause.Where{Exprs: expressions})
	return &a
}

func (a {{$.QueryStructName}}{{$relationship}}{{$relation.Name}}) WithContext(ctx context.Context) *{{$.QueryStructName}}{{$relationship}}{{$relation.Name}} {
	a.db = a.db.WithContext(ctx)
	return &a
}

func (a {{$.QueryStructName}}{{$relationship}}{{$relation.Name}}) Model(m *{{$.StructInfo.Package}}.{{$.StructInfo.Type}}) *{{$.QueryStructName}}{{$relationship}}{{$relation.Name}}Tx {
	return &{{$.QueryStructName}}{{$relationship}}{{$relation.Name}}Tx{a.db.Model(m).Association(a.Name())}
}

type {{$.QueryStructName}}{{$relationship}}{{$relation.Name}}Tx struct{ tx *gorm.Association }

func (a {{$.QueryStructName}}{{$relationship}}{{$relation.Name}}Tx) Find() (result {{if eq $relationship "HasMany" "ManyToMany"}}[]{{end}}*{{$relation.Type}}, err error) {
	return result, a.tx.Find(&result)
}

func (a {{$.QueryStructName}}{{$relationship}}{{$relation.Name}}Tx) Append(values ...*{{$relation.Type}}) (err error) {
	targetValues := make([]interface{}, len(values))

	for i, v := range values {
		targetValues[i] = v
	}
	return a.tx.Append(targetValues...)
}

func (a {{$.QueryStructName}}{{$relationship}}{{$relation.Name}}Tx) Replace(values ...*{{$relation.Type}}) (err error) {
	targetValues := make([]interface{}, len(values))
	for i, v := range values {
		targetValues[i] = v
	}
	return a.tx.Replace(targetValues...)
}

func (a {{$.QueryStructName}}{{$relationship}}{{$relation.Name}}Tx) Delete(values ...*{{$relation.Type}}) (err error) {
	targetValues := make([]interface{}, len(values))
	for i, v := range values {
		targetValues[i] = v
	}
	return a.tx.Delete(targetValues...)
}

func (a {{$.QueryStructName}}{{$relationship}}{{$relation.Name}}Tx) Clear() error {
	return a.tx.Clear()
}

func (a {{$.QueryStructName}}{{$relationship}}{{$relation.Name}}Tx) Count() int64 {
	return a.tx.Count()
}

{{end}}{{end}}type {{.QueryStructName}}Do struct { gen.DO }