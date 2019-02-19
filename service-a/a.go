package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/hc", hc)

	log.Fatal(http.ListenAndServe(":4000", nil))
}

func hc(res http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(res, "This is service a")
}
