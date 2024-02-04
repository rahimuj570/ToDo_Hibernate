package helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateFactory {

	public SessionFactory session_fact = null;
	public SessionFactory getFactory() {
		if (session_fact == null) {
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			session_fact = cfg.buildSessionFactory();
		}
		return session_fact;
	}

	public void CloseFactory() {
		if (session_fact.isOpen())
			session_fact.close();
	}

}
