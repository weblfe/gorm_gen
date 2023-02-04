package template

var (
	// TableQueryStruct table query struct
	TableQueryStruct = GetCodeTpl(`table`)

	// TableQueryStructWithContext table query struct with context
	TableQueryStructWithContext = GetCodeTpl(`table_context`)

	// TableQueryIface table query interface
	TableQueryIface = GetCodeTpl(`table_interface`)
)
