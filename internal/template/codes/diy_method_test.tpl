
var {{.OriginStruct.Type}}{{.MethodName}}TestCase = []TestCase{}

func Test_{{.TargetStruct}}_{{.MethodName}}(t *testing.T) {
	{{.TargetStruct}} := new{{.OriginStruct.Type}}(db)
	do := {{.TargetStruct}}.WithContext(context.Background()).Debug()

	for i, tt := range {{.OriginStruct.Type}}{{.MethodName}}TestCase {
		t.Run("{{.MethodName}}_"+strconv.Itoa(i), func(t *testing.T) {
			{{.GetTestResultParamInTmpl}} := do.{{.MethodName}}({{.GetTestParamInTmpl}})
			{{.GetAssertInTmpl}}
		})
	}
}

