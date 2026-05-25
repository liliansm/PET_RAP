@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS de Interface de animais'
define root view entity ZI_ANIMAL_01 as select from ztanimal_01 as Animal
{
    @EndUserText.label: 'ID'
    key id as Id,
    @EndUserText.label: 'Nome'
    nome as Nome,
    @EndUserText.label: 'Idade'
    idade as Idade,
    @EndUserText.label: 'Espécie'
    especie as Especie,
    @EndUserText.label: 'Sexo'
    sexo as Sexo

}
