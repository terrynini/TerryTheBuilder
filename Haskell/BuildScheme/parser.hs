import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

readExpr :: String -> String
readExpr input = case parse (spaces >> symbol) "lisp" input of  -- use bind to ignore spaces before checking symbol
    Left err -> "No match: " ++ show err
    Right val -> "Found value"

spaces :: Parser () -- actually, there is a function `lexeme` in Parsec do the same thing
spaces = skipMany1 space

main :: IO ()
main = do
    (expr:_) <- getArgs
    putStrLn $ readExpr expr
