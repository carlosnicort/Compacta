<select id="grupoSelect">
  <?php foreach($grupos as $g): ?>
    <option value="<?= $g['cod_grupo'] ?>"><?= $g['cod_grupo'] ?></option>
  <?php endforeach; ?>
</select>
<button id="seleccionarGrupo">Seleccionar</button>

<script>
document.getElementById('seleccionarGrupo').addEventListener('click', () => {
    const codGrupo = document.getElementById('grupoSelect').value;
    fetch(`/backend/grupos/setCurrentGroupHandler.php?cod_grupo=${codGrupo}`)
      .then(r => r.json())
      .then(res => {
        if(res.success){
            window.location.href = res.next;
        } else {
            alert(res.message);
        }
      });
});
</script>
