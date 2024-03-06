CREATE DATABASE ecommerce;
USE ecommerce;
  	
CREATE TABLE indirizzi(
	Id INT NOT NULL,
   via VARCHAR(50) NOT NULL,
   citta VARCHAR(50) NOT NULL,
   numero INT NOT NULL,
   codicePostale INT(5) NOT NULL,
   PRIMARY KEY (Id)
);

CREATE TABLE ruoli(
	Id INT PRIMARY KEY,
	ruolo VARCHAR(30)
);

CREATE TABLE users(
	Id INT PRIMARY KEY,
   nome VARCHAR(50) NOT NULL,
   cognome VARCHAR(50) NOT NULL,
   Id_indirizzo INT NOT NULL,
   username VARCHAR(50) NOT NULL,
   password_utente VARCHAR(60) NOT NULL,
   ruolo INT NOT NULL,
   FOREIGN KEY (Id_indirizzo) REFERENCES indirizzi(Id),
   FOREIGN KEY (ruolo) REFERENCES ruoli(Id)
);

CREATE TABLE categorie(
	Id INT NOT NULL,
   nome VARCHAR(50) NOT NULL,
   immagine VARCHAR(50) NOT NULL,
   PRIMARY KEY (Id)
);

CREATE TABLE accessori(
	Id INT NOT NULL,
   nome VARCHAR(50) NOT NULL,
   costo DECIMAL(10,2) NOT NULL,
   PRIMARY KEY (Id)
);

CREATE TABLE prodotti(
	Id INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	immagine VARCHAR(50) NOT NULL,
   Id_accessorio INT NOT NULL,
   Id_categoria INT NOT NULL,
   costo DECIMAL(10,2) NOT NULL,
   PRIMARY KEY (Id),
   FOREIGN KEY (Id_accessorio) REFERENCES accessori(Id),
   FOREIGN KEY (Id_categoria) REFERENCES categorie(Id)
);

CREATE TABLE carrello(
	Id INT NOT NULL,
	Id_user INT NOT NULL,
	Id_prodotto int NOT NULL,
   PRIMARY KEY (Id),
   FOREIGN KEY (Id_user) REFERENCES users(Id),
   FOREIGN KEY (Id_prodotto) REFERENCES prodotti(Id)
);carrello

CREATE TABLE ordine(
	Id INT NOT NULL,
   Id_user INT NOT NULL,
   Id_prodotto INT NOT NULL,
   Id_accessorio INT NOT NULL,
   stato VARCHAR(50) NOT NULL,
   `data` DATE NOT NULL,
   PRIMARY KEY (Id),
   FOREIGN KEY (Id_user) REFERENCES users(Id),
   FOREIGN KEY (Id_prodotto) REFERENCES prodotti(Id),
   FOREIGN KEY (Id_accessorio) REFERENCES accessori(Id)
);

CREATE TABLE accessori_prodotti(
	Id_prodotto INT NOT NULL,
   Id_accessorio INT NOT NULL,
   FOREIGN KEY (Id_prodotto) REFERENCES prodotti(Id),
   FOREIGN KEY (Id_accessorio) REFERENCES accessori(Id)
);


INSERT INTO categorie (Id, nome, immagine)
VALUES (1, 'Salotto', 'salotto.jpeg'),
(2, 'Cucina', 'cucina.jpeg'),
(3, 'Ufficio', 'ufficio.jpeg'),
(4, 'Camera da Letto', 'camera.jpeg'),
(5, 'Giardino', 'giardino.jpeg');

-- -----------------------------------dati---------------------------------------
INSERT INTO accessori (Id, nome, costo)
VALUES (1, 'Cuscino decorativo', 12.99),
(2, 'Tovaglia', 19.99),
(3, 'Vaso di fiori', 29.99),
(4, 'Lampada da tavolo', 49.99),
(5, 'Tappeto', 79.99);

-- Popola la tabella prodotti con dati immaginari
INSERT INTO prodotti (Id, nome, immagine, Id_accessorio, Id_categoria, costo)
VALUES 
(1, 'Divano in pelle', 'divano_pelle.jpeg', 1, 1, 799.99),
(2, 'Tavolo da pranzo', 'tavolo_panzo.jpeg', 2, 2, 349.99),
(3, 'Scrivania moderna', 'scrivania_moderna.jpeg', 4, 3, 199.99),
(4, 'Letto matrimoniale', 'letto_matrimoniale.jpeg', 5, 4, 899.99),
(5, 'Sedia a sdraio', 'sedia_sdraio.jpeg', 3, 5, 149.99);

-- Associa accessori ai prodotti
INSERT INTO accessori_prodotti (Id_prodotto, Id_accessorio)
VALUES
(1, 1), (1, 3), (1, 5),
(2, 2), (2, 5),
(3, 3),
(4, 3), (4, 4),
(5, 5);

-- Popola la tabella indirizzi con dati immaginari
INSERT INTO indirizzi (Id, via, citta, numero, codicePostale)
VALUES
(1, 'Via Roma', 'Milano', 10, 20121),
(2, 'Via delle Rose', 'Roma', 15, 00100),
(3, 'Piazza San Marco', 'Venezia', 5, 30124);

-- Popola la tabella ruoli con dati immaginari
INSERT INTO ruoli (Id, ruolo)
VALUES
(1, 'Amministratore'),
(2, 'Utente');

-- Popola la tabella users con dati immaginari
INSERT INTO users (Id, nome, cognome, Id_indirizzo, username, password_utente, ruolo)
VALUES
(1, 'Mario', 'Rossi', 1, 'mario.rossi', 'password123', 1),
(2, 'Laura', 'Bianchi', 2, 'laura.bianchi', 'securepwd', 2),
(3, 'Giovanni', 'Verdi', 3, 'giovanni.verdi', 'strongpass', 2);

-- Popola la tabella carrello con dati immaginari
INSERT INTO carrello (Id, Id_user, Id_prodotto)
VALUES
(1, 1, 1),
(2, 2, 3);

-- Popola la tabella ordine con dati immaginari
INSERT INTO ordine (Id, Id_user, Id_prodotto, Id_accessorio, stato, `data`)
VALUES
(1, 1, 1, 1, 'In attesa di spedizione', '2024-02-27'),
(2, 2, 2, 2, 'Consegnato', '2024-02-26');



/*
-- Popola la tabella accessori con dati immaginari
INSERT INTO accessori (Id, nome, costo)
VALUES 
(6, 'Cuscino decorativo a righe', 14.99),
(7, 'Centrotavola in ceramica', 39.99),
(8, 'Lampada da terra', 79.99),
(9, 'Ombrellone da giardino', 99.99),
(10, 'Set di tovagliette', 29.99);

-- Popola la tabella prodotti con dati immaginari
INSERT INTO prodotti (Id, nome, immagine, Id_accessorio, Id_categoria, costo)
VALUES 
(6, 'Divano a due posti in tessuto', 'divano_tessuto.jpeg', 6, 1, 599.99),
(7, 'Tavolo da cucina allungabile', 'tavolo_allungabile.jpeg', 7, 2, 449.99),
(8, 'Sedia ergonomica da ufficio', 'sedia_ergonomica.jpeg', 8, 3, 149.99),
(9, 'Letto singolo con contenitore', 'letto_contenitore.jpeg', 9, 4, 499.99),
(10, 'Set da pranzo da giardino', 'set_pranzo_giardino.jpeg', 10, 5, 349.99);

-- Associa accessori ai prodotti
INSERT INTO accessori_prodotti (Id_prodotto, Id_accessorio)
VALUES
(6, 6), (6, 1), (6, 3),
(7, 2), (7, 10),
(8, 4),
(9, 3), (9, 5),
(10, 10), (10, 9);

-- Popola la tabella indirizzi con dati immaginari aggiuntivi
INSERT INTO indirizzi (Id, via, citta, numero, codicePostale)
VALUES
(4, 'Via Venezia', 'Napoli', 20, 80100),
(5, 'Via dei Pini', 'Firenze', 8, 50100);

-- Popola la tabella users con dati immaginari aggiuntivi
INSERT INTO users (Id, nome, cognome, Id_indirizzo, username, password_utente, ruolo)
VALUES
(4, 'Anna', 'Verdi', 4, 'anna.verdi', 'annapass', 2),
(5, 'Marco', 'Ferrari', 5, 'marco.ferrari', 'marcopass', 2),
(6, 'admin', 'admin', 1, 'admin', 'adminpass', 1);

-- Popola la tabella carrello con dati immaginari aggiuntivi
INSERT INTO carrello (Id, Id_user)
VALUES
(3, 3),
(4, 4),
(5, 5);

-- Popola la tabella carrello_prodotti con dati immaginari aggiuntivi
INSERT INTO carrello_prodotti (Id_carrello, Id_prodotto)
VALUES
(3, 7),
(4, 8),
(5, 9);

-- Popola la tabella ordine con dati immaginari aggiuntivi
INSERT INTO ordine (Id, Id_user, Id_prodotto, Id_accessorio, stato, `data`)
VALUES
(3, 3, 7, 2, 'In attesa di pagamento', '2024-02-25'),
(4, 4, 8, 4, 'Spedito', '2024-02-24'),
(5, 5, 9, 3, 'In lavorazione', '2024-02-23');




-- Popola la tabella accessori con dati immaginari
INSERT INTO accessori (Id, nome, costo)
VALUES 
(11, 'Tappeto da esterno', 89.99),
(12, 'Cuscino per sedia da giardino', 16.99),
(13, 'Lampadario a sospensione', 129.99),
(14, 'Scrivania per computer', 199.99),
(15, 'Specchio decorativo', 69.99);

-- Popola la tabella prodotti con dati immaginari
INSERT INTO prodotti (Id, nome, immagine, Id_accessorio, Id_categoria, costo)
VALUES 
(11, 'Poltrona reclinabile in rattan', 'poltrona_rattan.jpeg', 11, 1, 249.99),
(12, 'Set di pentole antiaderenti', 'set_pentole.jpeg', 12, 2, 79.99),
(13, 'Scrivania con ripiano estraibile', 'scrivania_ripiano.jpeg', 14, 3, 299.99),
(14, 'Armadio a specchio', 'armadio_specchio.jpeg', 15, 4, 699.99),
(15, 'Set da pranzo in legno', 'set_pranzo_legno.jpeg', 10, 5, 449.99);

-- Associa accessori ai prodotti
INSERT INTO accessori_prodotti (Id_prodotto, Id_accessorio)
VALUES
(11, 11), (11, 5),
(12, 12), (12, 5),
(13, 15), (13, 3),
(14, 5), (14, 15),
(15, 10), (15, 11);

-- Popola la tabella indirizzi con dati immaginari aggiuntivi
INSERT INTO indirizzi (Id, via, citta, numero, codicePostale)
VALUES
(6, 'Via Garibaldi', 'Torino', 30, 10100),
(7, 'Via Roma', 'Bologna', 25, 40100),
(8, 'Corso Vittorio Emanuele', 'Palermo', 45, 90100);

-- Popola la tabella users con dati immaginari aggiuntivi
INSERT INTO users (Id, nome, cognome, Id_indirizzo, username, password_utente, ruolo)
VALUES
(7, 'Sara', 'Russo', 6, 'sara.russo', 'sarapass', 2),
(8, 'Luigi', 'Gallo', 7, 'luigi.gallo', 'luigipass', 2),
(9, 'superadmin', 'superadmin', 8, 'superadmin', 'superpass', 1);

-- Popola la tabella carrello con dati immaginari aggiuntivi
INSERT INTO carrello (Id, Id_user)
VALUES
(6, 6),
(7, 7),
(8, 8);

-- Popola la tabella carrello_prodotti con dati immaginari aggiuntivi
INSERT INTO carrello_prodotti (Id_carrello, Id_prodotto)
VALUES
(6, 12),
(7, 13),
(8, 14);

-- Popola la tabella ordine con dati immaginari aggiuntivi
INSERT INTO ordine (Id, Id_user, Id_prodotto, Id_accessorio, stato, `data`)
VALUES
(6, 6, 12, 12, 'In attesa di pagamento', '2024-02-22'),
(7, 7, 13, 15, 'Spedito', '2024-02-21'),
(8, 8, 14, 5, 'Consegnato', '2024-02-20');

*/
