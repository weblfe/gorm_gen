package generate

import "fmt"

var pluginsTypeMap = map[string]string{
   "soft_delete.DeletedAt":	"gorm.io/plugin/soft_delete",
}

func AppendPluginsImportPkgPaths(modelMeta *QueryStructMeta) *QueryStructMeta {
		if modelMeta == nil || len(modelMeta.Fields)<=0 {
				return modelMeta
		}
		for _,v:=range modelMeta.Fields {
				if pkg,ok:=pluginsTypeMap[v.Type];ok {
						modelMeta.ImportPkgPaths = append(modelMeta.ImportPkgPaths,fmt.Sprintf("\"%s\"",pkg))
				}
		}
		return modelMeta
}