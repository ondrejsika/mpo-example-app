package main

import (
	"os"

	"github.com/sikalabs/hello-world-server/pkg/server"
)

func main() {
	os.Setenv("TEXT", "Hello MPO!")
	os.Setenv("COLOR", "white")
	os.Setenv("BACKGROUND_COLOR", "#91C4F4")
	server.Server()
}
