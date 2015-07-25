/auth/register
curl -i -X POST --data "email=jm2%40shabb.com&password=success&password_confirmation=success&confirm_success_url=abc" http://localhost:3000/auth
	HTTP/1.1 403 Forbidden
	X-Frame-Options: SAMEORIGIN
	X-Xss-Protection: 1; mode=block
	X-Content-Type-Options: nosniff
	Content-Type: application/json; charset=utf-8
	Cache-Control: no-cache
	X-Request-Id: 7b2e78f8-ecb9-4805-86c1-f401be196d00
	X-Runtime: 0.692042
	Server: WEBrick/1.3.1 (Ruby/2.1.5/2014-11-13)
	Date: Mon, 08 Dec 2014 01:16:04 GMT
	Content-Length: 389
	Connection: Keep-Alive

	{"registrations":[["status","error"],["data",{"id":null,"email":"jm@shabb.com","errors":{"email":["has already been taken"],"password":["is too short (minimum is 8 characters)"]}}],["errors",[["email",["has already been taken"]],["password",["is too short (minimum is 8 characters)"]],["full_messages",["Email has already been taken","Password is too short (minimum is 8 characters)"]]]]]}

	HTTP/1.1 200 OK
	X-Frame-Options: SAMEORIGIN
	X-Xss-Protection: 1; mode=block
	X-Content-Type-Options: nosniff
	Content-Type: application/json; charset=utf-8
	Etag: "d796de255d7fc0d2a8e21544262248f6"
	Cache-Control: max-age=0, private, must-revalidate
	X-Request-Id: 3d3efe33-1c37-412b-b8b4-ed60f1ca2819
	X-Runtime: 0.189012
	Server: WEBrick/1.3.1 (Ruby/2.1.5/2014-11-13)
	Date: Fri, 05 Dec 2014 10:52:36 GMT
	Content-Length: 47
	Connection: Keep-Alive

	{"errors":{"email":["has already been taken"]}}

/auth/token_status
curl -i -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOjE0MTc3NzYzNTQsImV4cCI6MTQxNzg2Mjc1NH0.6PR5VxZRQB9-MIz-ncVKDlB5u4KMVqTiaEBGoDIOBQ8" http://localhost:3000/auth/token_status?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOjE0MTc3NzYzNTQsImV4cCI6MTQxNzg2Mjc1NH0.6PR5VxZRQB9-MIz-ncVKDlB5u4KMVqTiaEBGoDIOBQ8
	HTTP/1.1 200 OK
	X-Frame-Options: SAMEORIGIN
	X-Xss-Protection: 1; mode=block
	X-Content-Type-Options: nosniff
	Content-Type: text/html
	Etag: "7215ee9c7d9dc229d2921a40e899ec5f"
	Cache-Control: max-age=0, private, must-revalidate
	X-Request-Id: d90e935d-b78c-4027-a152-4bc4f34a9518
	X-Runtime: 0.022002
	Server: WEBrick/1.3.1 (Ruby/2.1.5/2014-11-13)
	Date: Fri, 05 Dec 2014 10:50:31 GMT
	Content-Length: 1
	Connection: Keep-Alive

	HTTP/1.1 401 Unauthorized
	X-Frame-Options: SAMEORIGIN
	X-Xss-Protection: 1; mode=block
	X-Content-Type-Options: nosniff
	Content-Type: text/html
	Cache-Control: no-cache
	X-Request-Id: 1eaf8904-bf33-4dc7-adc9-d7f1a625e956
	X-Runtime: 0.023976
	Server: WEBrick/1.3.1 (Ruby/2.1.5/2014-11-13)
	Date: Fri, 05 Dec 2014 10:59:41 GMT
	Content-Length: 1
	Connection: Keep-Alive


/auth/authenticate
curl -i -X POST --data "email=jm%40shabb.com&password=success" http://localhost:3000/auth/authenticate
	HTTP/1.1 200 OK
	X-Frame-Options: SAMEORIGIN
	X-Xss-Protection: 1; mode=block
	X-Content-Type-Options: nosniff
	Content-Type: application/json; charset=utf-8
	Etag: "41cfbde6ec24e50e824ec3c5f6a6ceeb"
	Cache-Control: max-age=0, private, must-revalidate
	X-Request-Id: ad134872-0cf6-4c9f-afd5-1a2186cbcc2c
	X-Runtime: 0.205016
	Server: WEBrick/1.3.1 (Ruby/2.1.5/2014-11-13)
	Date: Fri, 05 Dec 2014 10:52:14 GMT
	Content-Length: 195
	Connection: Keep-Alive

	{"user":{"id":1,"email":"jm@shabb.com"},"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOjE0MTc3NzY3MzQsImV4cCI6MTQxNzg2MzEzNH0.krIoguP-btFR-kFwYQpgbgznlLBWqIe3ifj65FClBlQ"}

/api/messages/create
curl -i -X POST --data "body=hello%20world" -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOjE0MTc3NzYzNTQsImV4cCI6MTQxNzg2Mjc1NH0.6PR5VxZRQB9-MIz-ncVKDlB5u4KMVqTiaEBGoDIOBQ8" http://localhost:3000/api/messages
	HTTP/1.1 401 Unauthorized
	X-Frame-Options: SAMEORIGIN
	X-Xss-Protection: 1; mode=block
	X-Content-Type-Options: nosniff
	Content-Type: application/json; charset=utf-8
	Cache-Control: no-cache
	X-Request-Id: 64ae04be-a0e4-4888-9b17-a56cd13be879
	X-Runtime: 0.062003
	Server: WEBrick/1.3.1 (Ruby/2.1.5/2014-11-13)
	Date: Fri, 05 Dec 2014 10:58:45 GMT
	Content-Length: 42
	Connection: Keep-Alive

	{"error":"Authorization header not valid"}

	HTTP/1.1 200 OK
	X-Frame-Options: SAMEORIGIN
	X-Xss-Protection: 1; mode=block
	X-Content-Type-Options: nosniff
	Content-Type: application/json; charset=utf-8
	Etag: "2889363992cb98f214adba8b920904e4"
	Cache-Control: max-age=0, private, must-revalidate
	X-Request-Id: c6e16370-08a9-4d87-bf56-f534d6bbdc42
	X-Runtime: 0.267990
	Server: WEBrick/1.3.1 (Ruby/2.1.5/2014-11-13)
	Date: Fri, 05 Dec 2014 10:59:07 GMT
	Content-Length: 29
	Connection: Keep-Alive

	{"id":1,"body":"hello world"}

	HTTP/1.1 500 Internal Server Error
	X-Frame-Options: SAMEORIGIN
	X-Xss-Protection: 1; mode=block
	X-Content-Type-Options: nosniff
	Content-Type: application/json; charset=utf-8
	Cache-Control: no-cache
	X-Request-Id: d0f733e1-e8d9-4418-b193-33da28575d53
	X-Runtime: 0.044999
	Server: WEBrick/1.3.1 (Ruby/2.1.5/2014-11-13)
	Date: Fri, 05 Dec 2014 11:00:28 GMT
	Content-Length: 33
	Connection: Keep-Alive

	{"error":"Internal Server Error"}


/api/tasks/create
curl -i -X POST --data "name=parent&priority=0" -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOjE0MTc3OTUzNDAsImV4cCI6MTQxNzg4MTc0MH0.wVa_LOBruHwNmIkykqbcGTJ9Nh4bV_aYq1gUz1lijUw" http://localhost:3000/api/tasks

/api/tasks/create
curl -i -X POST --data "name=child&priority=0&parent_id=1" -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOjE0MTc3OTUzNDAsImV4cCI6MTQxNzg4MTc0MH0.wVa_LOBruHwNmIkykqbcGTJ9Nh4bV_aYq1gUz1lijUw" http://localhost:3000/api/tasks

/api/tasks
curl -i -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOjE0MTc3OTUzNDAsImV4cCI6MTQxNzg4MTc0MH0.wVa_LOBruHwNmIkykqbcGTJ9Nh4bV_aYq1gUz1lijUw" http://localhost:3000/api/tasks