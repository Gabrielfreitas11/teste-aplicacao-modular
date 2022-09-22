exports.formatCsvData = (data) => {
  const newData = new Array(...data);

  const keys = {};

  newData.splice(0, 1);

  newData
    .filter((e) => e[1] != undefined && e[2] != 'N/A')
    .forEach((x) => {
      if (keys[x[1]] == undefined) { keys[x[1]] = []; }

      keys[x[1]].push(x[2]);
    });

  return keys;
};
