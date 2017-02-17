using System.Diagnostics;
using System;

// Also see Laucher.java the Class.forName call and the prefix
//[assembly: IKVM.Attributes.NoPackagePrefixAttribute]
namespace foo
{
	class Foo
	{
		public Foo()
		{
		}
	}

	class MainClass
	{
		public static void Main (string[] args)
		{
			Console.WriteLine("starting up...");
			Launcher.main("foo.Foo");
		}
	}
}

