const HttpResponse = require('../../../../common/httpResponse');
const { importCsvData } = require('../../client/getCsvData');

const { importAllData } = require('./functions/importAllData');
const { formatCsvData } = require('./functions/formatCsvData');

module.exports = async () => {
  try {
    const data = await importCsvData();

    const formatedCsv = formatCsvData(data);

    await importAllData(formatedCsv);

    return HttpResponse.ok({
      status_code: 200,
      response: {
        message: 'Dados atualizados no banco com sucesso',
      },
    });
  } catch (error) {
    console.log(error);
    return HttpResponse.serverError({
      status_code: 500,
      message: 'Erro ao executar a função cepAdapter',
    });
  }
};
