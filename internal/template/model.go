package template

// Model used as a variable because it cannot load template file after packed, params still can pass file
var Model =  GetCodeTpl(`model`)
// ModelMethod model struct DIY method
var ModelMethod = GetCodeTpl(`model_method`)
