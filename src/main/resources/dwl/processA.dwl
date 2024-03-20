%dw 2.0
output application/csv
---
payload map (item, idx) -> {
	"Name": item[0].Name,
	"Email": item[0].Email
}