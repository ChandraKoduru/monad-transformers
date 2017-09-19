module Args 
  (getArgs, Args(..))
where

import Options.Applicative (Parser, long, info, header, help, metavar
  , progDesc, helper, (<**>), execParser, strOption
  , fullDesc, (<|>), short, flag', ParserInfo)

import Data.Semigroup ((<>))

data Args = Args 
  { dirPath :: String
  , output :: Output 
  } deriving (Show)

data Output = FileOutput FilePath 
            | StdOutput 
            deriving (Show)

options :: Parser Args
options = Args
  <$> targetDirectoryParser
  <*> outputParser

targetDirectoryParser :: Parser String
targetDirectoryParser = strOption 
  ( long "directory" 
  <> metavar "DIRECTORY"
  <> help "Directory path " )

outputParser :: Parser Output
outputParser = fileOutput <|> stdOutput

fileOutput :: Parser Output
fileOutput = FileOutput <$> strOption
  ( long "file"
  <> short 'f'
  <> metavar "FILENAME"
  <> help "Output file")

stdOutput :: Parser Output
stdOutput = flag' StdOutput
  ( long "stdout" 
  <> help "Write to stdout")

args :: ParserInfo Args
args = info (options <**> helper)
  ( fullDesc
    <> progDesc "Program description"
    <> header "Program header")

getArgs :: IO Args
getArgs = execParser args
