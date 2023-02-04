
// {{.DocComment }}
func ({{.S}} {{.TargetStruct}}Do){{.FuncSign}}{
	{{if .HasSQLData}}var params []interface{}

	{{end}}var generateSQL strings.Builder
	{{range $line:=.Section.Tmpls}}{{$line}}
	{{end}}

	{{if .HasNeedNewResult}}result ={{if .ResultData.IsMap}}make{{else}}new{{end}}({{if ne .ResultData.Package ""}}{{.ResultData.Package}}.{{end}}{{.ResultData.Type}}){{end}}
	{{if .ReturnSQLResult}}stmt := {{.S}}.UnderlyingDB().Statement
	result,{{if .ReturnError}}err{{else}}_{{end}} = stmt.ConnPool.ExecContext(stmt.Context,generateSQL.String(){{if .HasSQLData}},params...{{end}}) // ignore_security_alert
	{{else if .ReturnSQLRow}}row = {{.S}}.UnderlyingDB().Raw(generateSQL.String(){{if .HasSQLData}},params...{{end}}).Row() // ignore_security_alert
	{{else if .ReturnSQLRows}}rows,{{if .ReturnError}}err{{else}}_{{end}} = {{.S}}.UnderlyingDB().Raw(generateSQL.String(){{if .HasSQLData}},params...{{end}}).Rows() // ignore_security_alert
	{{else}}var executeSQL *gorm.DB
	executeSQL = {{.S}}.UnderlyingDB().{{.GormOption}}(generateSQL.String(){{if .HasSQLData}},params...{{end}}){{if not .ResultData.IsNull}}.{{.GormRunMethodName}}({{if .HasGotPoint}}&{{end}}{{.ResultData.Name}}){{end}}  // ignore_security_alert
	{{if .ReturnRowsAffected}}rowsAffected = executeSQL.RowsAffected
	{{end}}{{if .ReturnError}}err = executeSQL.Error
	{{end}}{{if .ReturnNothing}}_ = executeSQL
	{{end}}{{end}}
	return
}
