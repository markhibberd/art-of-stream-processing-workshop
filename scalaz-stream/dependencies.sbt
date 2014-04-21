libraryDependencies ++= Seq(
  "org.scalaz.stream"       %% "scalaz-stream"      % "0.4.1",
  "org.scalaz"              %% "scalaz-core"        % "7.0.6",
  "org.scalaz"              %% "scalaz-effect"      % "7.0.6",
  "org.scalaz"              %% "scalaz-concurrent"  % "7.0.6",
  "org.specs2"              %% "specs2"             % "2.3.11"        % "test"
)

resolvers ++= Seq(
  Resolver.sonatypeRepo("releases"),
  Resolver.sonatypeRepo("snapshots"),
  Resolver.typesafeRepo("releases"),
  "Scalaz Bintray Repo" at "http://dl.bintray.com/scalaz/releases"
)
