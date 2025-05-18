package main

import (
	"log"
	"os"

	"github.com/ondrejsika/counter/server"
)

func main() {
	os.Setenv("EXTRA_TEXT", "Hello MPO!")
	os.Setenv("PORT", "8000")

	if os.Getenv("LICENSE") != "mpo2025" {
		log.Fatalln("invalid license key in environment variable LICENSE")
	}
	server.Server(false)
}
