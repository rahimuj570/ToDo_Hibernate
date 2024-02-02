package helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateFactory {

	public static SessionFactory fact = null;

	public static SessionFactory getFactory() {
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		fact = cfg.buildSessionFactory();
		return fact;
	}

	public static void CloseFactory() {
		if (fact != null)
			fact.close();
	}

}
