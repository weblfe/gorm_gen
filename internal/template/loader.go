package template

import (
	"embed"
	"io"
	"strings"
)

//go:embed codes/*.tpl
var templates embed.FS

func GetTemplateFs() embed.FS {
	return templates
}


func GetCodeTpl(file string) string {
	if !strings.HasPrefix(file, "codes/") {
		file = "codes/" + file
	}
	if !strings.HasSuffix(file,".tpl") {
			file = file + ".tpl"
	}
	fd, err := GetTemplateFs().Open(file)
	if err != nil {
		return ""
	}
	content, _ := io.ReadAll(fd)
	return string(content)
}

func CodeSnippetJoin(str ...string) string {
	return strings.Join(str,"")
}