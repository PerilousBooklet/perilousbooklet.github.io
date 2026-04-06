# ?

## `javac`

https://docs.oracle.com/en/java/javase/17/docs/specs/man/javac.html

## `jar`

https://docs.oracle.com/javase/tutorial/deployment/jar/downman.html

https://www.baeldung.com/java-classpath-include-jars

## From Java 8 to 21

TODO

## Example: ANSI codes

```java
package main;

public class Main {
  
  public static final String ANSI_RED    = "\u001B[31m";
  public static final String ANSI_GREEN  = "\u001B[32m";
  public static final String ANSI_YELLOW = "\u001B[33m";
  public static final String ANSI_CYAN   = "\u001B[36m";
  public static final String ANSI_RESET  = "\u001B[0m";
  
  public static void info(String s) {
    System.out.println(
	    ANSI_GREEN + "[INFO] " + ANSI_RESET + 
	    s + ANSI_RESET
    );
  }
	
	public static void main(String args[]) {
	  Main.info("Hello there!");
	}
	
}
```


