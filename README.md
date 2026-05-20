# Guardian 100 best novels: the data

I have been enjoying reading through (and arguing with!) the Guardian's [100 best novels list](https://www.theguardian.com/books/ng-interactive/2026/may/12/the-100-best-novels-of-all-time).

I thought it would be fun to do a bit of statistical messing around with the votes and see what I could find out. **I've written about some statistical experiments I did with this [here, on my blog](https://mpaldridge.github.io/blog/guardian-novels.html).** This is the nerdier version for people who want to play with the data themselves.

With a bit of rootling around you can find [this file](https://interactive.guim.co.uk/atoms/2026/03/2026-best-100-books-testing/best-100-books/v/1778864974/app.js), and then – in my case, with help from GPT – you can extract all the voting data. To save anyone else the effort, you can find that voting data in a much more pleasant CSV file in this repository. The relevant files are

* **`votes.csv`** contains all of the voting data
* **`guardian-ranking.csv`** is the Guardian's top 100 list


## Scoring method

The Guardian doesn't say how they turned the raw votes into the top-100 ranking, but it seems to be *almost* consistent with the following method:

* A book gets 20 points for being mentioned on a list at all.
* The book then gets extra points for how high it is on the list: 1 extra point for tenth, 2 extra points for ninth, and so on, up to 10 extra points for first.
* So overall, the scores are 21 for tenth, 22 for ninth, up to 30 for ninth.

(The scoring method might not exactly be this – you can probably change the 20 a bit and still get equivalent results. And of course you can scale the scores by some constant factor without changing anything. But I’m fairly sure the true scoring method must be pretty close to this.)

The R script **`scoring.R`** applies this scoring method to the voting data, and the resulting scores for each novel are in **`my_scores.csv`**.

## Errors and other problems

Well, the Guardian's list *almost* seems consistent with this method. If we compare the Guardian's ranking with the one I reproduced with this method, we see two differences. First, my method gives some ties – of course, it's totally fair for the Guardian to break ties in whatever way they see fit. (Commiserations to A Portrait of the Artist as a Young Man by James Joyce, which looks like it missed out on the tie-breaker, having the same score as Catch-22, The Road, and The Go-Between, all three of which just sneaked in.)

But, second, there is one big inconsistency. In my scoring, **My Ántonia** by Willa Cather comes joint 75th, alongside The Bluest Eye, Dracula, and The Rainbow. But in the Guardian's list, My Ántonia only just scraped onto the list at position 100. What could explain this? Well, I don't know the Guardian's scoring method was the same as mine. Perhaps it was slightly different in such a way that the whole top 100 was totally unaffected with the sole exception of My Ántonia being knocked down 25 places. More likely, it seems to me, is that there was an error somewhere. The best explanation I can come up with is that Tahmima Anam's tenth-place vote for it somehow got ignored. That vote gave the book 20 points for being included, plus 1 point for being tenth. Without it, My Ántonia's score goes down from 100 to 79, which moves it down from joint-75th to joint-97th, consistent with its ranking of 100.)

Another issue is the book by Albert Camus called **L’Étranger** in French. Its title has been translated as both The Stranger (more common in the US) and The Outsider (more common in the UK). “The Stranger” received two votes, for 51 points, and “The Outsider” also received two votes, for 52 points. Individually, neither of these are enough to get on the list – but, merged together, 103 points for The Stranger/Outsider is enough to catapult it up to 71st place, between Jude the Obscure by Thomas Hardy and Kindred by Octavia E Butler.

In the data in this repository:

* All the votes for My Ántonia were counted, so it has a score of 100 in `my_scores.csv`.
* I have *not* merged together votes for The Outsider and The Stranger in either `votes.csv` or `my_scores.csv`.
* In the Guardian's raw data, the book by Laurence Stern ranked 19th in the list appears as both "The Life and Opinions of Tristram Shandy" and "The Life and Opinions of Tristram Shandy, Gentleman". Since the Guardian did correctly count these together in their calculations, I have changed the non-"Gentleman" entries to with-"Gentleman" in `votes.csv`.
* Users should be cautious about other consistencies in the data outside the top 100 that I have *not* altered or fixed. For example, the novel by Victor Hugo appears under both "Notre Dame De Paris" and "The Hunchback of Notre Dame"; Alice's Adventures in Wonderland also appears as "Alice in Wonderland"; punctuation of "JL Carr" and "VS Naipaul" are inconsistent; and so on. ([Steffen Rayburn-Maarup](https://bsky.app/profile/rayburnmaarup.bsky.social/post/3mmby3qgkhk22) noted some of these and some other inconsistencies or debatable issues with novels in a series.)


## The lists

Anyway, here's the Guardian's ranking (left) against the one reproduced by my scoring method (right). (This will be unpleasant to read on mobile.)

<table>
	<tr>
		<th></th>
		<th>Guardian ranking</th>
		<th>My reproduction</th>
	</tr>
	<tr>
		<td>1</td>
		<td>Middlemarch by George Eliot</td>
		<td>Middlemarch by George Eliot (1566)</td>
	</tr>
	<tr>
		<td>2</td>
		<td>Beloved by Toni Morrison</td>
		<td>Beloved by Toni Morrison (1143)</td>
	</tr>
	<tr>
		<td>3</td>
		<td>Ulysses by James Joyce</td>
		<td>Ulysses by James Joyce (996)</td>
	</tr>
	<tr>
		<td>4</td>
		<td>To the Lighthouse by Virginia Woolf</td>
		<td>To the Lighthouse by Virginia Woolf (815)</td>
	</tr>
	<tr>
		<td>5</td>
		<td>In Search of Lost Time by Marcel Proust</td>
		<td>In Search of Lost Time by Marcel Proust (741)</td>
	</tr>
	<tr>
		<td>6</td>
		<td>Anna Karenina by Leo Tolstoy</td>
		<td>Anna Karenina by Leo Tolstoy (729)</td>
	</tr>
	<tr>
		<td>7</td>
		<td>War and Peace by Leo Tolstoy</td>
		<td>War and Peace by Leo Tolstoy (562)</td>
	</tr>
	<tr>
		<td>8</td>
		<td>Jane Eyre by Charlotte Brontë</td>
		<td>Jane Eyre by Charlotte Brontë (541)</td>
	</tr>
	<tr>
		<td>9</td>
		<td>Pride and Prejudice by Jane Austen</td>
		<td>Pride and Prejudice by Jane Austen (519)</td>
	</tr>
	<tr>
		<td>10</td>
		<td>Madame Bovary by Gustave Flaubert</td>
		<td>Madame Bovary by Gustave Flaubert (517)</td>
	</tr>
	<tr>
		<td>11</td>
		<td>The Great Gatsby by F Scott Fitzgerald</td>
		<td>The Great Gatsby by F Scott Fitzgerald (516)</td>
	</tr>
	<tr>
		<td>12</td>
		<td>Bleak House by Charles Dickens</td>
		<td>Bleak House by Charles Dickens (512)</td>
	</tr>
	<tr>
		<td>13</td>
		<td>Emma by Jane Austen</td>
		<td>Emma by Jane Austen (484)</td>
	</tr>
	<tr>
		<td>14</td>
		<td>Mrs Dalloway by Virginia Woolf</td>
		<td>Mrs Dalloway by Virginia Woolf (477)</td>
	</tr>
	<tr>
		<td>15</td>
		<td>Moby-Dick by Herman Melville</td>
		<td>Moby-Dick by Herman Melville (476)</td>
	</tr>
	<tr>
		<td>16</td>
		<td>Nineteen Eighty-Four by George Orwell</td>
		<td>Nineteen Eighty-Four by George Orwell (475)</td>
	</tr>
	<tr>
		<td>17</td>
		<td>One Hundred Years of Solitude by Gabriel García Márquez</td>
		<td>One Hundred Years of Solitude by Gabriel García Márquez (464)</td>
	</tr>
	<tr>
		<td>18</td>
		<td>Persuasion by Jane Austen</td>
		<td>Persuasion by Jane Austen (445)</td>
	</tr>
	<tr>
		<td>19</td>
		<td>The Life and Opinions of Tristram Shandy, Gentleman by Laurence Sterne</td>
		<td>The Life and Opinions of Tristram Shandy, Gentleman by Laurence Sterne (442)</td>
	</tr>
	<tr>
		<td>20</td>
		<td>Wuthering Heights by Emily Brontë</td>
		<td>Wuthering Heights by Emily Brontë (414)</td>
	</tr>
	<tr>
		<td>21</td>
		<td>The Portrait of a Lady by Henry James</td>
		<td>The Portrait of a Lady by Henry James (404)</td>
	</tr>
	<tr>
		<td>22</td>
		<td>Things Fall Apart by Chinua Achebe</td>
		<td>Things Fall Apart by Chinua Achebe (366)</td>
	</tr>
	<tr>
		<td>23</td>
		<td>Midnight's Children by Salman Rushdie</td>
		<td>Midnight's Children by Salman Rushdie (339)</td>
	</tr>
	<tr>
		<td>24</td>
		<td>The Remains of the Day by Kazuo Ishiguro</td>
		<td>The Remains of the Day by Kazuo Ishiguro (326)</td>
	</tr>
	<tr>
		<td>25</td>
		<td>Lolita by Vladimir Nabokov</td>
		<td>Lolita by Vladimir Nabokov (319)</td>
	</tr>
	<tr>
		<td>26</td>
		<td>Don Quixote by Miguel de Cervantes</td>
		<td>Don Quixote by Miguel de Cervantes (304)</td>
	</tr>
	<tr>
		<td>27</td>
		<td>The Trial by Franz Kafka</td>
		<td>The Trial by Franz Kafka (290)</td>
	</tr>
	<tr>
		<td>28</td>
		<td>The Brothers Karamazov by Fyodor Dostoyevsky</td>
		<td>The Brothers Karamazov by Fyodor Dostoyevsky (272)</td>
	</tr>
	<tr>
		<td>29</td>
		<td>Pale Fire by Vladimir Nabokov</td>
		<td>Pale Fire by Vladimir Nabokov (268)</td>
	</tr>
	<tr>
		<td>30</td>
		<td>Frankenstein by Mary Shelley</td>
		<td>Frankenstein by Mary Shelley (261)</td>
	</tr>
	<tr>
		<td>31</td>
		<td>The Prime of Miss Jean Brodie by Muriel Spark</td>
		<td>The Prime of Miss Jean Brodie by Muriel Spark (257)</td>
	</tr>
	<tr>
		<td>32</td>
		<td>The God of Small Things by Arundhati Roy</td>
		<td>The God of Small Things by Arundhati Roy (256)</td>
	</tr>
	<tr>
		<td>33</td>
		<td>David Copperfield by Charles Dickens</td>
		<td>David Copperfield by Charles Dickens (251)</td>
	</tr>
	<tr>
		<td>34</td>
		<td>Wolf Hall by Hilary Mantel</td>
		<td>Wolf Hall by Hilary Mantel (244)</td>
	</tr>
	<tr>
		<td>35</td>
		<td>Great Expectations by Charles Dickens</td>
		<td>Great Expectations by Charles Dickens (232)</td>
	</tr>
	<tr>
		<td>36</td>
		<td>The Handmaid's Tale by Margaret Atwood</td>
		<td>The Handmaid's Tale by Margaret Atwood (230)</td>
	</tr>
	<tr>
		<td>37</td>
		<td>Invisible Man by Ralph Ellison</td>
		<td>Invisible Man by Ralph Ellison (225)</td>
	</tr>
	<tr>
		<td>38</td>
		<td>The Age of Innocence by Edith Wharton</td>
		<td>The Age of Innocence by Edith Wharton (223)</td>
	</tr>
	<tr>
		<td>39</td>
		<td>Their Eyes Were Watching God by Zora Neale Hurston</td>
		<td>Their Eyes Were Watching God by Zora Neale Hurston (194)</td>
	</tr>
	<tr>
		<td>40</td>
		<td>Song of Solomon by Toni Morrison</td>
		<td>Song of Solomon by Toni Morrison (184)</td>
	</tr>
	<tr>
		<td>41</td>
		<td>Heart of Darkness by Joseph Conrad</td>
		<td>Heart of Darkness by Joseph Conrad (182)</td>
	</tr>
	<tr>
		<td>42</td>
		<td>The Magic Mountain by Thomas Mann</td>
		<td>The Magic Mountain by Thomas Mann (177)</td>
	</tr>
	<tr>
		<td>43</td>
		<td>Housekeeping by Marilynne Robinson</td>
		<td>Housekeeping by Marilynne Robinson (175)</td>
	</tr>
	<tr>
		<td>44</td>
		<td>Giovanni's Room by James Baldwin</td>
		<td>Giovanni's Room by James Baldwin (172)</td>
	</tr>
	<tr>
		<td>45</td>
		<td>The Golden Notebook by Doris Lessing</td>
		<td>The Golden Notebook by Doris Lessing (170)</td>
	</tr>
	<tr>
		<td>46</td>
		<td>The Leopard by Giuseppe Tomasi di Lampedusa</td>
		<td>The Leopard by Giuseppe Tomasi di Lampedusa (159)</td>
	</tr>
	<tr>
		<td>47</td>
		<td>Vanity Fair by William Makepeace Thackeray</td>
		<td>Vanity Fair by William Makepeace Thackeray (155)</td>
	</tr>
	<tr>
		<td>48</td>
		<td>The Metamorphosis by Franz Kafka</td>
		<td>The Metamorphosis by Franz Kafka (154)</td>
	</tr>
	<tr>
		<td>49</td>
		<td>A Fine Balance by Rohinton Mistry</td>
		<td>A Fine Balance by Rohinton Mistry (151)</td>
	</tr>
	<tr>
		<td>50</td>
		<td>Wide Sargasso Sea by Jean Rhys</td>
		<td>Wide Sargasso Sea by Jean Rhys (145)</td>
	</tr>
	<tr>
		<td>51</td>
		<td>My Brilliant Friend by Elena Ferrante</td>
		<td>My Brilliant Friend by Elena Ferrante (142)</td>
	</tr>
	<tr>
		<td>52</td>
		<td>The Golden Bowl by Henry James</td>
		<td>The Golden Bowl by Henry James (138)</td>
	</tr>
	<tr>
		<td>53</td>
		<td>The Transit of Venus by Shirley Hazzard</td>
		<td>The Transit of Venus by Shirley Hazzard (135)</td>
	</tr>
	<tr>
		<td>54</td>
		<td>Orlando by Virginia Woolf</td>
		<td>Orlando by Virginia Woolf (134)</td>
	</tr>
	<tr>
		<td>55</td>
		<td>The Waves by Virginia Woolf</td>
		<td>The Waves by Virginia Woolf (133)</td>
	</tr>
	<tr>
		<td>56</td>
		<td>Mansfield Park by Jane Austen</td>
		<td>Mansfield Park by Jane Austen (131)</td>
	</tr>
	<tr>
		<td>57</td>
		<td>The Sound and the Fury by William Faulkner</td>
		<td>The Sound and the Fury by William Faulkner (129)</td>
	</tr>
	<tr>
		<td>58</td>
		<td>Disgrace by JM Coetzee</td>
		<td>Disgrace by JM Coetzee (127)</td>
	</tr>
	<tr>
		<td>59</td>
		<td>Never Let Me Go by Kazuo Ishiguro</td>
		<td>Never Let Me Go by Kazuo Ishiguro (126)</td>
	</tr>
	<tr>
		<td>60</td>
		<td>Howards End by EM Forster</td>
		<td>Howards End by EM Forster (124)</td>
	</tr>
	<tr>
		<td>61</td>
		<td>The Rings of Saturn by WG Sebald</td>
		<td>The Rings of Saturn by WG Sebald (123)</td>
	</tr>
	<tr>
		<td>62</td>
		<td>Half of a Yellow Sun by Chimamanda Ngozi Adichie</td>
		<td>Half of a Yellow Sun by Chimamanda Ngozi Adichie (120)</td>
	</tr>
	<tr>
		<td>63</td>
		<td>White Teeth by Zadie Smith</td>
		<td>White Teeth by Zadie Smith (120)</td>
	</tr>
	<tr>
		<td>64</td>
		<td>The Good Soldier by Ford Madox Ford</td>
		<td>The Good Soldier by Ford Madox Ford (118)</td>
	</tr>
	<tr>
		<td>65</td>
		<td>The Color Purple by Alice Walker</td>
		<td>The Color Purple by Alice Walker (113)</td>
	</tr>
	<tr>
		<td>66</td>
		<td>The Master and Margarita by Mikhail Bulgakov</td>
		<td>The Master and Margarita by Mikhail Bulgakov (112)</td>
	</tr>
	<tr>
		<td>67</td>
		<td>The Man Without Qualities by Robert Musil</td>
		<td>The Man Without Qualities by Robert Musil (108)</td>
	</tr>
	<tr>
		<td>68</td>
		<td>Blood Meridian by Cormac McCarthy</td>
		<td rowspan="3">Blood Meridian by Cormac McCarthy (104)<br>Crime and Punishment by Fyodor Dostoevsky (104)<br>Jude the Obscure by Thomas Hardy (104)</td>
	</tr>
	<tr>
		<td>69</td>
		<td>Crime and Punishment by Fyodor Dostoevsky</td>
	</tr>
	<tr>
		<td>70</td>
		<td>Jude the Obscure by Thomas Hardy</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td><i>The Stranger/Outsider by Albert Camus (103) ought to be here</i></td>
	</tr>
	<tr>
		<td>71</td>
		<td>Kindred by Octavia E Butler</td>
		<td rowspan="2">Kindred by Octavia E Butler (102)<br>Our Mutual Friend by Charles Dickens (102)</td>
	</tr>
	<tr>
		<td>72</td>
		<td>Our Mutual Friend by Charles Dickens</td>
	</tr>
	<tr>
		<td>73</td>
		<td>Austerlitz by WG Sebald</td>
		<td rowspan="2">Austerlitz by WG Sebald (101)<br>Nervous Conditions by Tsitsi Dangarembga (101)</td>
	</tr>
	<tr>
		<td>74</td>
		<td>Nervous Conditions by Tsitsi Dangarembga</td>
	</tr>
	<tr>
		<td>75</td>
		<td>The Bluest Eye by Toni Morrison</td>
		<td rowspan="3">The Bluest Eye by Toni Morrison (100)<br>Dracula by Bram Stoker (100)<br>The Rainbow by DH Lawrence (100)<br><strong style="color: red;">My Ántonia by Willa Cather (100)</strong></td>
	</tr>
	<tr>
		<td>76</td>
		<td>Dracula by Bram Stoker</td>
	</tr>
	<tr>
		<td>77</td>
		<td>The Rainbow by DH Lawrence</td>
	</tr>
	<tr>
		<td>78</td>
		<td>A House for Mr Biswas by VS Naipaul</td>
		<td rowspan="3">A House for Mr Biswas by VS Naipaul (98)<br>Go Tell It on the Mountain by James Baldwin (98)<br>Rebecca by Daphne du Maurier (98)</td>
	</tr>
	<tr>
		<td>79</td>
		<td>Go Tell It on the Mountain by James Baldwin</td>
	</tr>
	<tr>
		<td>80</td>
		<td>Rebecca by Daphne du Maurier</td>
	</tr>
	<tr>
		<td>81</td>
		<td>Buddenbrooks by Thomas Mann</td>
		<td rowspan="3">Buddenbrooks by Thomas Mann (97)<br>The End of the Affair by Graham Greene (97)<br>A Farewell to Arms by Ernest Hemingway (97)</td>
	</tr>
	<tr>
		<td>82</td>
		<td>The End of the Affair by Graham Greene</td>
	</tr>
	<tr>
		<td>83</td>
		<td>A Farewell to Arms by Ernest Hemingway</td>
	</tr>
	<tr>
		<td>84</td>
		<td>The Talented Mr Ripley by Patricia Highsmith</td>
		<td rowspan="3">The Talented Mr Ripley by Patricia Highsmith (96)<br>The Vegetarian by Han Kang (96)<br>The Turn of the Screw by Henry James (96)</td>
	</tr>
	<tr>
		<td>85</td>
		<td>The Vegetarian by Han Kang</td>
	</tr>
	<tr>
		<td>86</td>
		<td>The Turn of the Screw by Henry James</td>
	</tr>
	<tr>
		<td>87</td>
		<td>The Line of Beauty by Alan Hollinghurst</td>
		<td>The Line of Beauty by Alan Hollinghurst (95)</td>
	</tr>
	<tr>
		<td>88</td>
		<td>Ragtime by EL Doctorow</td>
		<td>Ragtime by EL Doctorow (93)</td>
	</tr>
	<tr>
		<td>89</td>
		<td>The Left Hand of Darkness by Ursula K Le Guin</td>
		<td>The Left Hand of Darkness by Ursula K Le Guin (90)</td>
	</tr>
	<tr>
		<td>90</td>
		<td>Jacob's Room by Virginia Woolf</td>
		<td>Jacob's Room by Virginia Woolf (86)</td>
	</tr>
	<tr>
		<td>91</td>
		<td>Life and Fate by Vasily Grossman</td>
		<td>Life and Fate by Vasily Grossman (83)</td>
	</tr>
	<tr>
		<td>92</td>
		<td>Sentimental Education by Gustave Flaubert</td>
		<td>Sentimental Education by Gustave Flaubert (82)</td>
	</tr>
	<tr>
		<td>93</td>
		<td>Invisible Cities by Italo Calvino</td>
		<td rowspan="3">Invisible Cities by Italo Calvino (81)<br>The Known World by Edward P Jones (81)<br>The Return of the Native by Thomas Hardy (81)</td>
	</tr>
	<tr>
		<td>94</td>
		<td>The Known World by Edward P Jones</td>
	</tr>
	<tr>
		<td>95</td>
		<td>The Return of the Native by Thomas Hardy</td>
	</tr>
	<tr>
		<td>96</td>
		<td>Pedro Páramo by Juan Rulfo</td>
		<td>Pedro Páramo by Juan Rulfo (80)</td>
	</tr>
	<tr>
		<td>97</td>
		<td>Catch-22 by Joseph Heller</td>
		<td rowspan="4">Catch-22 by Joseph Heller (79)<br>The Road by Cormac McCarthy (79)<br>The Go-Between by LP Hartley (79)<br><i>A Portrait of the Artist as a Young Man by James Joyce (79)</i></td>
	</tr>
	<tr>
		<td>98</td>
		<td>The Road by Cormac McCarthy</td>
	</tr>
	<tr>
		<td>99</td>
		<td>The Go-Between by LP Hartley</td>
	</tr>
	<tr>
		<td>100</td>
		<td><strong style="color: red;">My Ántonia by Willa Cather</strong></td>
	</tr>
</table>

**[More analysis on my blog, here.](https://mpaldridge.github.io/blog/guardian-novels.html)**




