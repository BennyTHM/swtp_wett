<h2>Kontakt</h2>


<?php





?>


<form action="public/bearbeiteKontaktanfrage.php" method="post">
	<ul>
		<li>
			<label for "email">Email:</label>
			<input type="text" name="email" id="email"/>
				

		</li>
		<li>
			<label for="betreff">Betreff:</label>
			<select id="betreff" name="betreff">
				<option value="Frage">Frage</option>
				<option value="Kritik">Kritik</option>
				<option value="Benutzer-Beschwerde">Benutzer-Beschwerde</option>
				<option value="Bestechungen">Bestechungen</option>
			</select>
		</li>
		<li>
			<label for "message">Hier koennen Sie reinschreiben:</label>
			<textarea id="message" name="message" cols="42" rows="9"></textarea>
		</li>
			<input id="submit" type="submit" name="submit" value="Abschicken">
		</li>
	</ul>
</form>


