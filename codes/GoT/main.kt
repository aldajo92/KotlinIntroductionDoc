import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.Card
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.ExperimentalComposeUiApi
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.ComposeViewport
import kotlinx.browser.document

val got_characters_json = """[
  {
    "id": 0,
    "firstName": "Daenerys",
    "lastName": "Targaryen",
    "fullName": "Daenerys Targaryen",
    "title": "Mother of Dragons",
    "family": "House Targaryen",
    "image": "daenerys.jpg",
    "imageUrl": "https://thronesapi.com/assets/images/daenerys.jpg"
  },
  {
    "id": 1,
    "firstName": "Samwell",
    "lastName": "Tarly",
    "fullName": "Samwell Tarly",
    "title": "Maester",
    "family": "House Tarly",
    "image": "sam.jpg",
    "imageUrl": "https://thronesapi.com/assets/images/sam.jpg"
  }
]"""

data class GotCharacter(val fullName: String, val title: String, val family: String)

fun parseCharacters(json: String): List<GotCharacter> {
    val blockRegex = """\{[^}]+\}""".toRegex()
    return blockRegex.findAll(json).map { block ->
        val text = block.value
        fun extractField(field: String): String =
            """"$field":\s*"([^"]*)"""".toRegex().find(text)?.groupValues?.get(1) ?: ""
        GotCharacter(
            fullName = extractField("fullName"),
            title = extractField("title"),
            family = extractField("family")
        )
    }.toList()
}

// punto de entrada
@OptIn(ExperimentalComposeUiApi::class)
fun main() {
    // Data
    val characters = parseCharacters(got_characters_json)
    
    // UI
    ComposeViewport(document.body!!) {
        Application(characters)
    }
}

@Composable
fun GotItem(character: GotCharacter) {
    Card(
        modifier = Modifier.fillMaxWidth().padding(horizontal = 12.dp, vertical = 6.dp),
        elevation = 4.dp
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(
                text = character.fullName,
                fontSize = 18.sp,
                fontWeight = FontWeight.Bold
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = character.title,
                fontSize = 14.sp,
                color = Color.DarkGray
            )
        }
    }
}

@Composable
fun Application(characters: List<GotCharacter>) {
    MaterialTheme {
        LazyColumn(
            modifier = Modifier.fillMaxSize().padding(vertical = 8.dp)
        ) {
            items(characters) { character ->
                GotItem(character)
            }
        }
    }
}