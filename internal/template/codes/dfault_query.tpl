
var (
	Q =new(Query)
	{{range $name,$d :=.Data -}}
	{{$d.ModelStructName}} *{{$d.QueryStructName}}
	{{end -}}
)

func SetDefault(db *gorm.DB, opts ...gen.DOOption) {
	*Q = *Use(db,opts...)
	{{range $name,$d :=.Data -}}
	{{$d.ModelStructName}} = &Q.{{$d.ModelStructName}}
	{{end -}}
}

