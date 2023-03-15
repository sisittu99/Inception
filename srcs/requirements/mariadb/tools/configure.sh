#script di avvio per un'immagine di Docker contenente Wordpress.
# In questo script, si attende l'avvio di MariaDB e si connette con le credenziali fornite. 
#Successivamente, se l'indice del sito Wordpress non esiste, lo script scarica Wordpress, 
#crea un file di configurazione, installa Wordpress, crea un utente e attiva un tema. 
#Infine, lo script installa e attiva Redis come sistema di caching.

#script di avvio per un'immagine di Docker contenente MariaDB. 
#In questo script, si controlla se la directory "/run/mysqld" esiste e, se non esiste, la si crea.
# Successivamente, se la directory "/var/lib/mysql/$DATABASE_NAME" non esiste, lo script installa 
#MariaDB e configura le autorizzazioni utente, creando un database e un utente amministratore con password.
# Infine, lo script modifica il file di configurazione MariaDB per consentire la connessione dalla
# rete esterna e avvia il servizio MariaDB.