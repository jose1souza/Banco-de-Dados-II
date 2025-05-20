-- Aula 08/04/2025
-- subconsultas permitem resolver problemas complexos com mais facilidade
/*alunos cujo a média de notas sejam superior a media geral
qual é a média geral
SELECT MEDIA(nota) FROM Aluno
SELECT nome FROM Aluno 
WHERE MEDIA(nota) > (SELECT MEDIA(nota) FROM Aluno)
ORDER BY nome;
*/
USE sakila; -- usando banco sakila
SHOW TABLES; -- mostrando tabelas do banco
DESCRIBE film; -- mostrando os atributos da tabela

SELECT AVG(rental_duration) FROM film;

-- selecionar todos os filmes onde o tempo de aluguel maior que a media de aluguel ordenando por maior para menor
SELECT 
    title, rental_duration
FROM
    film
WHERE
    rental_duration > (SELECT 
            AVG(rental_duration)
        FROM
            film)
ORDER BY rental_duration DESC;

-- filmes com tempo de aluguel igual ao tempo máximo de aluguel ordenado pelo campo rental_rate
SELECT 
    *
FROM
    film
WHERE
    rental_duration = (SELECT 
            MAX(rental_duration)
        FROM
            film)
ORDER BY rental_rate DESC;


DESCRIBE film;
DESCRIBE language;
-- filmes compo de aluguel maior que a media do tempo de aluguel. titulo ano e tempo de aluguel ordene pelo tempo de duração(DESC)
SELECT 
    f.title, f.release_year, f.rental_duration, l.name
FROM
    film AS f,
    language AS l
WHERE
    rental_duration > (SELECT 
            AVG(rental_duration)
        FROM
            film)
        AND l.language_id = f.language_id
ORDER BY rental_duration DESC;
