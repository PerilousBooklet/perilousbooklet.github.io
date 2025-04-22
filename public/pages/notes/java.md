# Java

TODO: toc

## Java

### Scaled Image

Create a scaled Image (example taken from Codex Naturalis demo):

```java
public Image image = Toolkit.getDefaultToolkit().getImage(new File("/home/raffaele/downloads/codex-naturalis/codex/image.png").getAbsolutePath());
public Image scaledImage = image.getScaledInstance(80, 53, Image.SCALE_SMOOTH);
```

Then draw it onto a JPanel with a Graphics object's `drawImage()`.

### Word Wrap

TODO: add example from Kanban project

### Yes/No Confirmation Menu

```java
Object[] options = { "Yes", "No" };
int n = JOptionPane.showOptionDialog(column, "Delete this Item?", "Warning", JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE, null, options, options[0]);
// Confirm deletion
if (n == 0) {
  write some code here
}
```

### Text Modification Menu

source: `s`

```java
// Unsupported Characters Check
public static boolean isValidInput(String input) {
	// TODO: check for excessive word length
  return input.matches("[a-zA-Z0-9:,.\"\'?! ]+");
}
```

```java
// Get ColumnTitleLabel text
String currentText = columnTitleLabel.getText();
String input = (String)JOptionPane.showInputDialog(column, "New text here...", currentText);
// input must be not-null and valid
if (input != null && Item.isValidInput(input)) {
  // Modify the text
  columnTitleLabel.setText(input);
  columnTitleLabel.revalidate();
  columnTitleLabel.repaint();
} else {
  logger.warning("Invalid input provided!");
}
```

## Object Communication

TODO: example from Kanban

mediator pattern...

TODO: draw simple/clear flux diagram for object comm data (basically object info and event info)

## Data Storage

TODO: ORM

TODO: JDBC

## Ant

## Gradle

## Hibernate

## JUnit

## LibGDX

## Basic Example

https://toxigon.com/libgdx-3d-game-development

## Maven

### How to add support for Javadocs with UML diagrams and code examples

<!-- Sources -->
<!-- https://maven.apache.org/plugins/maven-javadoc-plugin/usage.html -->
<!-- https://medium.com/@oresoftware/generate-javadocs-that-arent-completely-worthless-788e12c76516 -->
<!-- https://github.com/talsma-ict/umldoclet/blob/develop/usage.md#configuring-your-maven-build -->

1. Add `maven-javadoc-plugin` and `uml-doclet` as dependencies into `pom.xml`

`maven-javadoc-plugin`
```xml
<!-- Maven JavaDoc Site + UMLDoclet -->
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-javadoc-plugin</artifactId>
  <version>3.3.0</version>
  <executions>
    <execution>
      <id>attach-javadocs</id>
      <goals>
        <goal>jar</goal>
      </goals>
    </execution>
  </executions>
  <configuration>
    <doclet>nl.talsmasoftware.umldoclet.UMLDoclet</doclet>
    <docletArtifact>
      <groupId>nl.talsmasoftware</groupId>
      <artifactId>umldoclet</artifactId>
      <version>2.2.1</version>
    </docletArtifact>
    <additionalOptions>
      <additionalOption>--create-puml-files</additionalOption>
    </additionalOptions>
  </configuration>
</plugin>
```

`uml-doclet`
```xml
<dependency>
  <groupId>nl.talsmasoftware</groupId>
  <artifactId>umldoclet</artifactId>
  <version>2.2.1</version>
</dependency>
```

2. Add `mvn javadoc:javadoc` to `build.sh`

```sh
mvn javadoc:javadoc
firefox target/site/apidocs/index.html
```

3. Add support for `umldoclet`: write the following to `pom.xml`, within the `<configuration>` element of `maven-javadoc-plugin`:

(already done in step 1)

4. Add support for code examples with syntax highlighting: write the following to `pom.xml`:

(?)

5. Open the `target/site/apidocs/index.html` file with a web browser

(already done in step 2)

## Mockito

## Spring

### Basic Example

TODO: see `example-spring`

## Swing

### Init

TODO: see main() method in Kanban

### JOptionPane

https://docs.oracle.com/javase/8/docs/api/javax/swing/JOptionPane.html
