# Nessa configuração, a função roda independente de receber argumentos 
# numéricos ou não numéricos, porém emitindo aviso caso algum dos argumentos
# fornecidos for não numérico.

standardError <- function(values, na.rm=FALSE){
  if(!is.numeric(values)){
    # Verifica se os parâmetros contém valores não numéricos
    warning ("Argumento não é numérico: retornando NA")
  } else{
    return(sd(values)/sqrt(length(values)))
  }
  if(na.rm ==TRUE){
    # Separa os argumentos pela ","
    values<-strsplit(values, split =",")
    # Retorna somente os valores numéricos
    values = suppressWarnings(as.numeric(values)) # Suprime o aviso de conversão de "NA's"
    # Omite os valores NA's contidos nos argumentos.
    values = na.omit(values)
  }
  return(sd(values)/sqrt(length(values)))
}

standardError(c(3, 5, "a", 7),na.rm=TRUE)
