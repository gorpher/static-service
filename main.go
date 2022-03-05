package main

import (
	_ "embed"
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"
)

func main() {
	static := flag.String("static", "", "file location")
	ip := flag.String("ip", "", "http ip")
	port := flag.Int("port", 8080, "http port")
	flag.Parse()
	if *static == "" {
		*static, _ = os.Getwd()
	}
	if !filepath.IsAbs(*static) {
		location, _ := os.Getwd()
		*static = filepath.Join(filepath.Dir(location), *static)
	}
	address := fmt.Sprintf("%s:%d", *ip, *port)
	log.Printf("Listening on  %s  at %s\n", address, *static)
	if err := http.ListenAndServe(address, http.FileServer(http.Dir(*static))); err != nil {
		if err != http.ErrServerClosed {
			log.Fatalln(err)
		}
	}
}
