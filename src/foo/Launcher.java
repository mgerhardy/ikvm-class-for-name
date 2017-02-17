package foo;

public class Launcher {
	public static void main(final String name) {
		try {
			System.err.println("Starting up and trying to load " + name);
			// See GuiceRepo.cs
//			final Class<?> forName = Class.forName("cli." + name);
			final Class<?> forName = Class.forName(name);
			System.out.println("Finished loading " + forName);
		} catch (final ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
