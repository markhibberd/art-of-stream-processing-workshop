import AssemblyKeys._

organization := "io.mth"

name := "art-scalaz-stream"

version in ThisBuild := "0.1.0"

scalaVersion := "2.11.0"

scalacOptions := Seq(
  "-deprecation",
  "-unchecked",
  "-Xlint",
  "-feature",
  "-language:_"
)


assemblySettings

mainClass in assembly := None
