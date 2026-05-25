@EndUserText.label: 'CDS de Projeção de animais'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root view entity ZC_ANIMAL_01 as projection on ZI_ANIMAL_01 as Animal
{
    key Id,
    Nome,
    Idade,
    Especie,
    Sexo
}
