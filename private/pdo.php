<?php
/*
 * Author Name : Martin Lavalais
 * Web Site Name : Atlas Quiz
 * Description : For transaction between the website and the database
 */

/**
 * @return PDO|null
 * Return the pdo for transaction with the database
 */
function getPdo():PDO|null
{
    // keep the pdo if estiablished or set it null
    static $pdo = null;

    // If the connection is not established
    if($pdo == null)
    {
        // Make the connection
        $pdo = connectionDatabase();
    }

    // return the pdo
    return $pdo;
}

/**
 * @return PDO|null
 * Return the connection with the database
 * or null if its fail
 */
function connectionDatabase():PDO|null
{

    $dsn = "mysql:host=" . PDO_HOST .";port=" . PDO_PORT . "dbname=" . PDO_NAME .";charset=utf8";
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    ];
    try
    {
        return new PDO($dsn, PDO_USER, PDO_PASS, $options);
    } 
    catch (\PDOException $e) 
    {
        throw new \PDOException($e->getMessage(), (int)$e->getCode());
    }
}

/**
 * @param string $command command for the database
 * @param array $param Optional, parameter if you put it in the command, default = null
 * @return PDOStatment|false
 * If the transaction succed, he return the pdo
 * otherwise, he return false if its fail
 */
function makeTransaction(string $command, array $param = null):PDOStatement|false
{
    $pdo = getPdo();
    $stmt = $pdo->prepare($command);
    $stmt->execute($param);
    return $stmt;
}

/**
 * @param string $command command for the database
 * @param array $param Optional, parameter if you put it in the command, default = null
 * @param bool $fetchAll Default = false, if false he return the first object, if true, he return all the result
 * @return array|false
 * Return the result or false if its fail
 */
function makeResearch(string $command, array $param = null, bool $fetchAll = false):array|false
{
    // set the default response as false
    $response = false;

    // Take the result of the transaction
    $stmt = makeTransaction($command, $param);

    // If the transaction doesnt fail
    if ($stmt !== false)
    {
        // he check if you want the first result or all
        if ($fetchAll)
            $response = $stmt->fetchAll();
        else
            $response = $stmt->fetch();
        // he set the response
    }

    // and return the response
    return $response;
}