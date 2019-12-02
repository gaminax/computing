// gen.go
// split gen.go d1 d2 fe1
// in the project at d1, generate to the d2 subfoleder, the processing of file d1/fe1 to d1/d2/fe1. 
// gen.go ~/ws/github/gaminax/computing  docs index.ad

package main
import (
    "os"; "bufio"; "fmt"; "path/filepath" ; "strings"
    //"flag"; "log";
)
// var (
//    type Ab struct { a int; b int }
// )
const quoteChar = "\""

func wrap( str string , wrapper string ) string { return wrapper + str + wrapper }

func config( strVar string, strVal string ) string { return strVar + wrap( strVal, quoteChar ) }

func main () {
    args := os.Args
    //arg1 string := 'computing'
    var d1 string = args[1]
    var d2 string = args[2]
    var dfe string = args[3]
    var dfe1 = d1 +"/" +dfe
    df := filepath.Dir(dfe )
    fmt.Println( "df=" +df )
    fe := filepath.Base( dfe )
    fmt.Println( "fe=" + fe )
    e := filepath.Ext( fe )
    file := strings.TrimSuffix( fe, e )
    title := file
    var dfe2 = d1 +"/" +d2 +"/" +df +"/" +file +".md"
    var dd2 = filepath.Dir( dfe2 )
    fmt.Println( "dfe2=" + dfe2 +", dd2=" + dd2 )
    err := os.MkdirAll( dd2, 0755 )
    if err != nil { panic(err) }
    fp1, err := os.Open( dfe1 )
    if err != nil { panic(err) }
    fp2, err := os.Create( dfe2 )
    if err != nil { panic(err) }
    // scanner := bufio.NewScanner( os.Stdin )
    defer fp1.Close()
    scanner := bufio.NewScanner( fp1 )
    scanner.Split(bufio.ScanLines)
    // scanner.Split(bufio.ScanWords)
    fmt.Fprintln( fp2, "---" )
    fmt.Fprintln( fp2, "layout: default" )
    fmt.Fprintln( fp2, "title: " + wrap( title, quoteChar ) )
    fmt.Fprintln( fp2, "---" )
    for scanner.Scan() {
        var line = scanner.Text()
        fmt.Fprintln( fp2, line )
    }
    if err := scanner.Err(); err != nil {
        fmt.Fprintln( os.Stderr, " Err reading stdin: ", err ) }
    }

//

