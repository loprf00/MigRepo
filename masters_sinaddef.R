
SINADEF_container <- read_csv("C:/Users/tapia/Downloads/SINADEF_DATOS_ABIERTOS_30012021.csv", 
                                            col_types = cols(FECHA = col_date(format = "%m/%d/%Y")))
View(SINADEF_container)

#update and remove last date(imcomplete)
SINADEF_container %>% dplyr::select(Nº,FECHA) %>% filter(FECHA == max(SINADEF_container$FECHA))

sinadef_total <- SINADEF_container %>% filter(FECHA <= max(SINADEF_container$FECHA-1))

#Making a subset of covid19. Filtering those rows with Dx (U07%) and suspects with covid19.
sinadef <-sinadef_total %>% filter(`CAUSA A (CIE-X)` =="U071"| `CAUSA B (CIE-X)` == "U071"|
                                                        `CAUSA C (CIE-X)` =="U071"| `CAUSA D (CIE-X)` =="U071" |
                                                        `CAUSA E (CIE-X)` =="U071"| `CAUSA F (CIE-X)` == "U071"|
                                                        `CAUSA A (CIE-X)` =="U072"| `CAUSA B (CIE-X)` == "U072"|
                                                        `CAUSA C (CIE-X)` =="U072"| `CAUSA D (CIE-X)` =="U072" |
                                                        `CAUSA E (CIE-X)` =="U072"| `CAUSA F (CIE-X)` == "U072" |
                                                        `DEBIDO A (CAUSA A)` %like% "COVID" | `DEBIDO A (CAUSA B)` %like% "COVID"|
                                                        `DEBIDO A (CAUSA C)` %like% "COVID" | `DEBIDO A (CAUSA D)` %like% "COVID"| 
                                                        `DEBIDO A (CAUSA E)` %like% "COVID" | `DEBIDO A (CAUSA F)` %like% "COVID"|
                                                        `DEBIDO A (CAUSA A)` %like% "SARS" | `DEBIDO A (CAUSA B)` %like% "COVID"|
                                                        `DEBIDO A (CAUSA C)` %like% "SARS" | `DEBIDO A (CAUSA D)` %like% "COVID"|
                                                        `DEBIDO A (CAUSA E)` %like% "SARS" | `DEBIDO A (CAUSA F)` %like% "COVID"|
                                                        `DEBIDO A (CAUSA A)` %like% "CORONAV" | `DEBIDO A (CAUSA B)` %like% "CORONAV"|
                                                        `DEBIDO A (CAUSA C)` %like% "CORONAV" | `DEBIDO A (CAUSA D)` %like% "CORONAV"|
                                                        `DEBIDO A (CAUSA E)` %like% "CORONAV" | `DEBIDO A (CAUSA F)` %like% "CORONAV")

### Getting all records not related to Covid-19. Contains 'muertes violentas'
sinadef_nc <- anti_join(sinadef_total,sinadef, by = NULL) 

# Sum result should be the total deaths
nrow(sinadef)
nrow(sinadef_nc)
nrow(sinadef_total)

#########################################################################################################################################################
#sinadef_BD contains only confirmed covid19 cases following WHO guidelines.
sinadef_BD <- SINADEF_DATOS_ABIERTOS_11012021 %>% filter(`CAUSA B (CIE-X)` == "U071"|
                                                           `CAUSA C (CIE-X)` =="U071"| `CAUSA D (CIE-X)` =="U071" |
                                                           
                                                           `CAUSA B (CIE-X)` == "U072"|
                                                           `CAUSA C (CIE-X)` =="U072"| `CAUSA D (CIE-X)` =="U072" )

#                                                         `DEBIDO A (CAUSA B)` %like% "COVID"|
#                                                         `DEBIDO A (CAUSA C)` %like% "COVID" | `DEBIDO A (CAUSA D)` %like% "COVID"| 
#                                                         
#                                                         `DEBIDO A (CAUSA B)` %like% "COVID"|
#                                                         `DEBIDO A (CAUSA C)` %like% "SARS" | `DEBIDO A (CAUSA D)` %like% "COVID"|
#                                                         
#                                                         `DEBIDO A (CAUSA B)` %like% "CORONAV"|
#                                                         `DEBIDO A (CAUSA C)` %like% "CORONAV" | `DEBIDO A (CAUSA D)` %like% "CORONAV")
#                                                         

sinadef_BD1 <- SINADEF_DATOS_ABIERTOS_11012021 %>% filter(`CAUSA B (CIE-X)` == "U071"|
                                                            `CAUSA C (CIE-X)` =="U071"| `CAUSA D (CIE-X)` =="U071" )

#                                                          `CAUSA B (CIE-X)` == "U072"|
#                                                           `CAUSA C (CIE-X)` =="U072"| `CAUSA D (CIE-X)` =="U072" )

#                                                         `DEBIDO A (CAUSA B)` %like% "COVID"|
#                                                         `DEBIDO A (CAUSA C)` %like% "COVID" | `DEBIDO A (CAUSA D)` %like% "COVID"| 
#                                                         
#                                                         `DEBIDO A (CAUSA B)` %like% "COVID"|
#                                                         `DEBIDO A (CAUSA C)` %like% "SARS" | `DEBIDO A (CAUSA D)` %like% "COVID"|
#                                                         
#                                                         `DEBIDO A (CAUSA B)` %like% "CORONAV"|
#                                                         `DEBIDO A (CAUSA C)` %like% "CORONAV" | `DEBIDO A (CAUSA D)` %like% "COR