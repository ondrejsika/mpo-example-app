package main

import (
	"os"

	"github.com/ondrejsika/counter/server"
)

func main() {
	os.Setenv("EXTRA_TEXT", "Hello MPO!")
	os.Setenv("PORT", "8000")
	os.Setenv("BACKEND", "postgres")
	server.Server(false)
}
