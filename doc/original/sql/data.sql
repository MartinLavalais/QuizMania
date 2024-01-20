INSERT INTO icons VALUES 
(1, "default", "default-user.png");

INSERT INTO categories VALUES
(1, "Hors catégorie"),
(2, "Jeux-Vidéo"),
(3, "Anime/Manga"),
(4, "Histoire"),
(5, "Géographie"),
(6, "Sport"),
(7, "Informatique"),
(8, "Porno");

INSERT INTO question_types VALUES
(1, "Case à coché", false, 10),
(2, "Réponse à nombre", true, 5),
(3, "Réponse courte", true, 100),
(4, "Réponse longue", true, 1000);

/* The password is : Super */
INSERT INTO users VALUES
(1, null, "Administrateur", "no-reply@atlas-eternal.com", "$2y$10$MHgM53NBAM0IwrW3WM3ORO7A8h2qXNFCLS3HCKD5ccN4bLBiWUYRq", "2024-01-20 12:00:00", true, true, 1);