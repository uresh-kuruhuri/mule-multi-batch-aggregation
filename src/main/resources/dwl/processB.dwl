%dw 2.0
output application/csv
---
payload map (item,idx) -> {
	"Name": item[0].Name,
	"Phone": item[0].Phone,
	"DoB": item[0].DateOfBirth
}