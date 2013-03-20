package org.liveSense.dist.repositoryinstaller;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.jcr.LoginException;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.SimpleCredentials;

import org.apache.jackrabbit.api.JackrabbitSession;
import org.apache.jackrabbit.api.security.user.Authorizable;
import org.apache.jackrabbit.api.security.user.User;
import org.apache.jackrabbit.api.security.user.UserManager;
import org.apache.jackrabbit.core.RepositoryImpl;
import org.apache.jackrabbit.core.config.ConfigurationException;
import org.apache.jackrabbit.core.config.RepositoryConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.izforge.izpack.api.handler.AbstractUIProcessHandler;

public class ChangeAdminPassword {
	Logger log = LoggerFactory.getLogger(ChangeAdminPassword.class);
	private JackrabbitSession getJackrabbitSession(Session session) {
		if (session instanceof JackrabbitSession)
			return (JackrabbitSession) session;
		else
			return null;
	}

	private String getStackTrace(Throwable t)
	{
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw, true);
		t.printStackTrace(pw);
		pw.flush();
		sw.flush();
		return sw.toString();
	}

	public void run(AbstractUIProcessHandler handler, String[] args) {
		handler.startProcess("Changing admin password");
		handler.logOutput("Initialize JackRabbit repository...", false);
		String dir = args[0];
		String password = args[1];
		log.info("Log dir: "+dir);
		log.info("Password: "+password);

		RepositoryConfig config = null;
		RepositoryImpl repository = null;
		try {
			handler.logOutput("Getting repository.xml...", false);
			config = RepositoryConfig.create(new File(dir));
			handler.logOutput("Opening repository...", false);
			repository = RepositoryImpl.create(config);
		} catch (ConfigurationException e) {
			log.error("Open repository", e);
			handler.emitError("Could not configure repository", getStackTrace(e));
			handler.logOutput("Error on JackRabbit configuration...", true);
			handler.finishProcess();
		} catch (RepositoryException e) {
			log.error("Open repository", e);
			handler.emitError("Could not connect to repository", getStackTrace(e));
			handler.logOutput("Error on JackRabbit repository...", true);
			handler.finishProcess();
		}

		if (repository != null) {
			try {
				handler.logOutput("Logging in...", false);
				Session session = repository.login(new SimpleCredentials("admin", "admin".toCharArray()));
				handler.logOutput("Getting user manager...", false);
				UserManager userManager = getJackrabbitSession(session).getUserManager();
				handler.logOutput("Getting admin user...", false);
				Authorizable authorizable = userManager.getAuthorizable("admin");
				User user = (User) authorizable;
				handler.logOutput("Change password...", false);
				user.changePassword(password);
				handler.logOutput("Saving changes...", false);
				session.save();
				handler.logOutput("Logging in...", false);
				session.logout();
				handler.logOutput("Shutting down repository...", false);
				repository.shutdown();
			} catch (LoginException e) {
				log.error("Change password", e);
				handler.emitError("Could not login to repository as admin", getStackTrace(e));
				handler.logOutput("Error on JackRabbit repository...", true);
			} catch (RepositoryException e) {
				log.error("Change password", e);
				handler.emitError("Could execute operation on repository", getStackTrace(e));
				handler.logOutput("Error on JackRabbit repository...", true);
			}
		}
		handler.finishProcess();
	}

}
