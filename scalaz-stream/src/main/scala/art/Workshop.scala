package art

import scodec.bits.ByteVector
import scalaz._, Scalaz._
import scalaz.concurrent._
import scalaz.stream._

object main extends App {

  args.toList match {
    case "cat" :: Nil =>
      // use Workshop.cat and text.utf8Decode to implement `cat`
     ???
    case "yes" :: Nil =>
      // use Workshop.yes and text.utf8Decode to implement `yes`
      ???
    case "head" :: Nil =>
      // use Workshop.head and text.utf8Decode to implement `head`
     ???
    case "tail" :: Nil =>
      // use Workshop.tail and text.utf8Decode to implement tail`
     ???
   case "grep" :: term :: Nil =>
      // use Workshop.grep and text.utf8Decode to implement `fgrep`
     ???
    case "wcl" :: Nil =>
      // use Workshop.lc and text.utf8Decode to implement `wc -l`
      ???
    case "wc" :: Nil =>
      // use Workshop.wc and text.utf8Decode to implement `wc`
      ???
    case _ =>
      println("usage: java -jar target/*/*.jar art.main COMMAND")
      sys.exit(1)
  }

  def stdOutBytes: Sink[Task, ByteVector] =
    io.channel((b: ByteVector) => Task.delay { System.out.write(b.toArray) })
  def stdInBytes: Channel[Task, Int, ByteVector] =
    io.chunkR(System.in)
}

object Workshop {
  // emit all values that you receive
  def cat[A]: Process1[A, A] =
    ???

  // continuously emit the line "y"
  def yes: Process0[String] =
    ???

  // convert each chunk into lines, hint: process1.repartition
  def lines: Process1[String, String] =
    ???

  // just the first 10 lines (of arbitrary chunks), so don't forget to `lines` it)
  def head: Process1[String, String] =
    ???

  // just the last 10 lines, hint: process1.scan
  def tail: Process1[String, String] =
    ???

  // just the strings that contain this term
  def grep(term: String): Process1[String, String] =
    ???

  // chunk by line and than attach a line to each one
  def nl: Process1[String, (String, Int)] =
    ???

  // calculate a cksum, using xor of the ordinal value of each char, hint: fold1Map
  def cksum: Process1[String, Int] =
    ???

  // write process to sink, and return a new process that will continue to emit each value
  def tee[F[_], O](p: Process[F, O], s: Sink[F, O]): Process[F, O] =
    ???

  // count the number of lines in the input, hint: process1.foldMap
  def lc: Process1[String, Int] =
    ???

  // count the number lines, words and chars in the input, hint define your own monoid
  case class WordCount(lines: Int, words: Int, chars: Int)
  def wc: Process1[String, WordCount] =
    ???
}
