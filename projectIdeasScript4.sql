set names utf8mb4;
set charset utf8mb4;
drop database if exists ideas;
create database ideas charset utf8mb4;
use ideas;

-- -----------------------------------------------------
-- Table `ideas`.`catagories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideas`.`catagories` (
  `id` INT NOT NULL AUTO_INCREMENT primary key,
  `name` VARCHAR(45) NOT NULL);
  
INSERT INTO catagories(`name`) VALUES
('Beverage'),('Chemicals'),('Commercial Agriculture'),('Construction'),('Electronics'),
('Floor covering '),('Food Processing'),('Hand tools'),('Hotel and Tourism'),('Leather'),
('Metal Based Construction'),('Newsletter'),('Paper'),('Plastics and Rubber '),('Projects for the poor'),
('Real Estate'),('Small Machines'),('Textile'),('Wood Products');


-- -----------------------------------------------------
-- Table `ideas`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideas`.`cities` (
  `id` INT(11) NOT NULL AUTO_INCREMENT primary key,
  `name` VARCHAR(45) NOT NULL,
  `costPerAcer` INT(11) NOT NULL);

INSERT INTO cities(`name`,costPerAcer) VALUES
('Addis Ababa',4000),('Nazret',2000),('Dire Dawa',2000),('Bahir Dar',2000),('Dese', 2000),('Harar', 2000),('Gonder', 2000),
('Awasa', 2000),('Jīma', 2000),('Giyon', 2000),('Shashemene', 2000),('Adigrat',1000),
('Mekele', 3000),('Hosa’ina', 2000),('Asela', 2000),('Nek’emte', 2000),('Debre Mark’os', 2000),('Arba Minch', 2000),('Sodo', 2000),
('Debre Birhan', 2000),('Jijiga', 2000),('Aksum', 2000),('Dila', 2000),('Hagere Hiywet', 2000),('Yirga Alem', 2000),('Goba', 2000),
('Gimbi', 2000),('Asosa', 2000),('Dembi Dolo', 2000),('Bati', 2000),('Dolo Bay', 2000),('Negele', 2000),
('Gore', 2000),('Semera', 2000),('Gambela', 2000);
-- -----------------------------------------------------
-- Table `ideas`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideas`.`products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` LONGTEXT NOT NULL,
  `description` LONGTEXT NOT NULL,
  `rationale` LONGTEXT NULL DEFAULT NULL,
  `marketPotential` LONGTEXT NOT NULL,
  `rawMaterial` LONGTEXT NOT NULL,
  `technology` LONGTEXT NOT NULL,
  `benefits` LONGTEXT NOT NULL,
  `catagories_id` INT(11) NOT NULL,
  `cities_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_catagories_idx` (`catagories_id` ASC),
  INDEX `fk_products_cities1_idx` (`cities_id` ASC),
  CONSTRAINT `fk_products_catagories`
    FOREIGN KEY (`catagories_id`)
    REFERENCES `ideas`.`catagories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_cities1`
    FOREIGN KEY (`cities_id`)
    REFERENCES `ideas`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO products(`title`,`description`,`rationale`,`marketPotential`, `rawMaterial`, 
`technology`,`benefits`,catagories_id,cities_id) VALUES
(' Coffee Processing :Roasting, Grinding & Packing',' Coffee beans are sold to the consumer either as “raw” beans or roasted, ground (made to powder) and packed. Usually roasted coffee is sold to hotels, coffee shops, restaurants, pastries, etc. and “raw” coffee beans are sold to households where the roasting aspect of coffee making is as important as the coffee drinking itself. This project idea is to establish coffee roasting … enterprises in the Amhara region where roasting of coffee on commercial scale is virtually unknown. ' ,
' ',
'The main consumers of roasted coffee are restaurants, hotels, coffee and tea shops, etc. While there are hundred of coffee roasting, grinding and packing enterprises in Addis Ababa and in areas south of Addis Ababa, there are no such enterprises in the Amhara region. Like the “raw” coffee, the Amhara Region also imports roasted coffee from other regions of the country. With 2.1 million people living in the urban areas of the Region, the consumption of processed coffee (roasted and ground) is substantial. It is understandable why the Region imports the “green” coffee beans, but it does not give economic sense to import the processed coffee while it is possible to do the processing in the region. The present consumption of processed coffee in the urban centers of the Amhara Region is estimated to be about 4015 tons, and this consumption level will grow with further urbanization and increased population. ' ,
'The principal raw materials are coffee beans; and the beans will be imported from other parts of the country. Until the Region becomes self – sufficient in coffee production. ',
'Major processing stages include cleaning of the beans, grading, roasting grinding and packaging. Major machinery units will include cleaning machine, roasting, grinding and packing machines. ',
' More value added, promotes self sufficiency, saves financial resources',1,1),
(' Molasses Based Alcohol Production Plant',' Industrial alcohol is an important input in the manufacture of pharmaceutical and veterinary spirits, perfumes and alcoholic beverages. One major “raw material” for producing alcohol is molasses which is a by product of sugar factories. ', 
' ',
' Alcohol is in demand in pharmaceuticals, veterinary services, health care institutions such is health centers, clinics and hospitals, perfume producing factories, liquor producing beverage factories. Alcohol is also needed in households for emergency purposes, in barber shops and beauty salons. Many developing countries meet their alcohol requirements from imports. Molasses from which alcohol is produced is a by product of the country’s sugar factories. Domestic production of alcohol between 2000 and 2004 was on the average 14,400 hectoliters per year. On the other hand, average annual production of molasses during the same period was 50,300 tons; Molasses is used for alcohol production and as an ingredient in animal feed. Some portion of the product is exported. For a long time there has been a surplus in the production of molasses and the surplus product is dumped into streams or is used to maintain roads within the factory and plantation sites of the sugar factories.
All alcoholic beverages produced in the country are manufactured in and around Addis Ababa. These beverages are put in glass bottles and are distributed to all parts of the country near or far. The Amhara Region which is on the average about 500 km from Addis Ababa receives its share of alcoholic beverages from Addis Ababa. As the beverages are packed in glass bottles they are heavy, cumbersome and expensive to transport long distances. Between 2000 and 2004, the liquor consumption share of the Amhara Region was about 10,000 hecto liters per year on the average. Beverage products which use bottles for packaging are located near major consumer centers to avoid excessive transportation costs.
Currently, it is estimated that more than 20 thousand hector liter of ethyl alcohol per annum  is used in Ethiopia. Here, this figure is taken as a base for the future demand projection. And, in line with the economic growth, it is also assumed that for the coming ten years the annual utilization of ethanol will increase at 10 % per annum. Based on these assumptions, the future demand for ethyl alcohol is projected as follows.
These products are produced in different consumer centers and distributed regional or local markets. The liquor market in the Amhara region can justify the establishment of a liquor factory in the region. This factory will require alcohol as one of the major inputs. To supply the liquor factory with the required amount of alcohol, a factory that will refine molasses to produce alcohol will be needed. The raw material- molasses will be transported in big containers to the factory site to be used as input for the alcohol factory. The remaining part of the molasses will be used to produce animal feed which is in short supply in the region. Molasses for the alcohol factory will be transported from the existing factories until such a time that the Amhara Region establishes its own factory. The alcohol to be produced will not only used to make liquor; it will also be used for other purposes in health care institutions, barber shops, beauty salons, etc. ', 
'The main raw materials are molasses, sulphuric acid and nutritive salts (ammonia phosphate). For every 100 liters of alcohol distilled about 1.5 kgs of sulphuric acid and 0.35kg. of nutritive salts are required. The acids will be imported and the molasses will be obtained from domestic sources.',
 'The process of alcohol production is based on the fermentation of molasses and extracting the alcohol there from by using column distilleries. The molasses is diluted with water and allowed to ferment. From the fermented molasses, the alcohol is finally extracted. The required equipment and facilities include equipment for receiving and diluting molasses, pre-fermentation and fermentation equipment, distillation equipment, storage tanks, steam boiler and electric generating nit, laboratory equipment, truck mounted tanker for transporting the molasses. ', 
'Similar to other projects. ',1,1),
(' Processing or Fruit-Based Drinks',' There are a number of fruit types from which drinks or juices can be made. The common fruits from which fruit drinks or juices are made are organizes, grapes, pineapples, mangoes, papayas and other fruits of the citrus family. The juices or drinks are consumed usually during breakfast time or in refreshment hours. Processed fruits and drinks are normally packed in cans, bottles, plastic pouches or even in cartons.', 
' ',
'Currently, there are three main sources for the supply of fruit-based drinks and juices in the country. The largest supply comes from households, snack shops, pastries, coffee shops, restaurants, hotels and “juice houses”. It is almost impossible to estimate the volume of supply from scattered sources. The other domestic source is Merti Fruits Processing Plant located in the Awash Valley. This plant has produced an average of about 1300 tons of fruit drinks per year between 1986 and 1995; and during this period production by the plant had grown by 1.5 percent per year. The third source of supply is import. During the last 15 years, because of related foreign exchange control, imports of fruits drinks and juices have been growing fast. Now all the so-called super-markets and even small and large grocery stores are filled with imported fruit drinks and juices. In fact, this has negative impact on domestic production. Some newly established “milk Processing” enterprises supply what they call “fruit juices” to the market. (How a milk, processing plant can produce fruit juice is not clear.) The main determining factors for the demand of fruit juices and drinks are income and population size especially urban population. Admittedly, consumption of fruit juices and drinks in the Amhara Region is confined to a small section of the urban population. If we assume only 20 percent of the 400,000 urban families in the Region consume fruit juices and drinks regularly, the size of consumers in the Region is about 80,000. if we assume that a family of five consumes at least two liters of fruit juice or drink every day, the annual consumption of these products in the Region is 58,400 tons = (80,000X2 lit. X 365/100Kgs; 1000 lits.=1000Kgs.). One can feel this is optimistic estimate. To be on the safe side, let us say the estimated demand is one-half of the above estimate. This leaves us with a potential demand of 26000 tons per year. This can justify the establishment of medium size fruit-based drinks and juices producing plant. (project ideas have proposed the establishment of citrus fruits plantations in the Region.) ',
 ' Citrus fruits plantations in the Region and outside the Region.',
 'It is assumed that orange juices and drinks will be the main products of the plant. The Process of producing these products require cleaning of the raw material (organs), warming the fruits peeling, juice extracting, pre-heating and cooling, centrifugalization, deaeration, seasoning, sterilization, filling, cooling, labeling and packing.The main plant and machinery required are, receiving line and bins, inspection, washing and sizing, juice, extractors, finishers, pasteurizer, filler and sealer, cooling machine, labeler, centrifuge, evaporator, vessels with pumps, boiler, conveying unit, laboratory, concentrate production machinery and equipment. ', 
' Saves foreign exchange and regional financial resources, stimulates regional production of citrus fruits promotes self-sufficiency in food production',1,1),
(' Production of Malt for Breweries',' Malt is the major input to produce beer.  It is what is known in Amharic as “bikil”.  The raw material from which malt is made is malt barley which can be grown in many localities of the Region.  Basically, malt is prepared by soaking barley in water for a period for germination, drying it and making it into flour before it is used as an ingredient to make bear or whisky. ', 
'There are two large breweries in the Amhara Region (Dashen and Bati) established in the last 10 years.  These breweries either obtain their malt requirement from the Asella Malt Factory or they import it from abroad.  Most likely they import the malt.  This requires foreign exchange which has always been in short supply in our country.  The type of barley needed for malt production is being grown in Arsie and Bale.  This barley can be grown in the highland areas of the Amhara Region.  Hence it is possible to produce malt in the Region. ', 
' Domestic production of malt between 1999/200 and 2003/2004 was on the average 13,650 tons per year.  This production volume is perhaps one-half of the malt requirements of the existing breweries.  Subject to detail market study, the existing deficit in the supply for malt is estimated to be between 5000 to 8000 tons.  The proposed malt producing plant is to fill this supply gap and to make the Region self-sufficient in the production of malt.', 
' The raw material which is malt barley could be obtained from the high-land parts of the Region provided that malt barley seeds are distributed to farmers so that they grow the barley.', 
'Malt barely is fed into grading machines to obtain uniform malting parameters;  germination is carried out in “germinating boxes”, adding water from time to time to keep the product moisture constant.  The germinating process normally lasts five to six days; kilning process takes place; after clearing, the malt is stored in silos.  Main production machinery include barley intake and pre-cleaning, barley main cleaning and grading, germinating boxes, kiln conveyors, cooling plant, silos, etc. ','Saving in foreign exchange and regional financial resources, stimulating the farming sector of the Region, introduction of new skills and technology, self-sufficiency in this particular product. ',1,1),
(' Purified Water Bottling Plant',' Purified water has become popular among foreigners and high-income groups during the last 5 to 7 years. Now there are more than five purified water bottling plants in the country clustering in and around Addis Ababa. The product has in some areas become a conspicuous consumption item. ',
 ' When factory bottled purified water appeared in the market for the first time, many people doubted about the market success of the product because they believed that with low per capita income, not very many people will buy the product. But because of robust demand not only there is one bottling plant but more than 5 in a matter of six years. However, like many other factories, bottling plants of purified water are concentrated around Addis Ababa. Bottled water is one of those products which is expensive to transport long distances. Because purified water can be processed from springs, rivers, wells, etc., the bottling plant could be established any place where there are these water sources. So far, except for one or two bottling plants in North Shewa, there are no new purified water bottling plants in the Amhara Region. Consumers in the Region get their plastic bottled purified water from Addis Ababa which makes the price of the water almost twice that of Addis Ababa. The Region should be self-sufficient in the supply of purified water that people consume; and one or two bottling plants should be established in the region.',
 ' The main consumers of bottled purified water in the Amhara Region are the urban high-income groups and outsides who travel through the Region, such as tourists, businesspeople and civil servants. If we assume that at least five percent of the urban population (95,000) of the Region consumes one bottle of purified water per day, this amounts to an annual consumption of 35 million bottles which is more than one half of the production capacity of the Ambo Mineral Water Bottling Plant. With increasing population and modest annual increase of income, annual consumption of purified bottle water will also increase. In short, the current demand for purified bottled water will justify the establishment of about two bottling plants.', 
'Springs, wells, creeks, rivers where the plant is to be established. ',
 'The main stages of purification and bottling are pumping water from source to storage tanks, passing the water through a series of purification tanks, adding some chemicals at certain stages to further purify the water and bottling the water. Main machinery include water pumps with accessories, storage tanks, purification tanks, and bottling machine. ',
 'Economic utilization of a natural resource, promotion of self-sufficiency, introduction of new skills and technology, saving of regional financial resources. ',1,1),
(' Soft Drinks Bottling Plant','A soft drink is a type of man-made drink mainly composed of water (87%), sugar (12%), citric acid, color/essence, and sodium, benzonite.  A bottling plant is a plant which mixes and bottles the above ingredients in a factory set-up.  Non-alcoholic drinks or beverages like Coca Cola, Pepsi Cola, Fanta, etc are some examples of soft drinks. ',
 'There are two old and small soft drinks bottling plants in the Amhara Region- in Dessie and in Gondar.  These plants are not only old but they produce only Pepsi products which limits the choice of consumers.  Besides, their production capacity is small and does not satisfy the demand for soft drinks in the Region.  Considering the volume of soft drinks which the Region imports from Addis Ababa, it can be concluded that there is a need to establish one soft drink bottling plant in Bahir Dar. ', 
'Annual production of soft drinks in the country is about 300 million bottles of which only 16 million bottles are the production of the Amhara Region.  Annual consumption of soft drinks in the Region is about 80 million bottles which is 5 times the production capacity of the two soft drinks plants located in the Region.  Regional deficit of soft drinks supply is compensated by supply from Addis Ababa.  The current demand of soft drinks of the Region which is satisfied through imports can absorb the production of a new bottling plant and this will replace imports of the products from outside the Region.', 
'The two major raw materials- water and sugar will be obtained from domestic sources while others such as essence will be imported.  If possible, the new plant should be affiliated with the two giant multi-nationals Coca Cola or Pepsi Cola. ', 'The main processing stages are washing of bottles, premixing with concentrate, mixing of the sugar and syrup, carbonation of the mix, filling, cap fitting, inspection, and packing.  Main machinery includes, automatic bottle washer, automatic filling machine, blending and carbonating unit, syrup concentrate mixing unit, water treatment plant, carbon dioxide supply equipment, cap fixing machine, etc. ', 
' Self-sufficiency, saving of financial resources,',1,1),
(' Wine Production',' Wine is an alcoholic beverage product made from grapes which grow in Mediterranean type of climate. The product is consumed by people of different age groups, income and social classes. Though at an early stage, there is a new culture developing in large urban areas where people drink wine during meal times and in the evenings. There is growing medical evidence that drinking wine moderately is good from normal blood circulation and for regular hear beat.',
' ',
 'The supply of wine to the national market is composed of domestic production and imports. Some quantities of wine are also exported. Domestic production of wine is concentrated in and around Addis Ababa. The Amhara Region imports all its wine consumption from Addis Ababa and from abroad. Endowed with different types of soil and climate, the region has the potential of growing grapes from which wine is made of. The region has the potential not only to be self-sufficient in wine production for regional consumption but also for export. ',
 'For the first few years, grapes will be imported and then much of the grapes will be produced in local farms. ', 
' Like many other beverage products with alcohol content the main process of producing wine includes preparing the raw material by making it undergo different processes, fermentation addition of sugar and other additives, purifying or clearing the final product and bottling. There are a series of machines and tanks needed for producing wine.', 
'Saves regional financial resources, promotes self-sufficiency ',1,1);
-- -----------------------------------------------------
-- Table `ideas`.`costs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideas`.`costs` (
  `machinery` INT(11) NOT NULL,
  `labor` INT(11) NOT NULL,
  `cities_id` INT(11) NOT NULL,
  INDEX `fk_costs_cities1_idx` (`cities_id` ASC),
  CONSTRAINT `fk_costs_cities1`
    FOREIGN KEY (`cities_id`)
    REFERENCES `ideas`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO costs(machinery,labor,cities_id) VALUES
(1000000,300000,1),
(1300000,800000,1),
(22000000,2000000,1),
(4200000,750000,1),
(3000000,500000,1),
(900000,300000,1),
(7500000,800000,1);

CREATE TABLE users (
  id int unsigned NOT NULL AUTO_INCREMENT primary key,
firstname varchar(50) not null,
  lastname varchar(50) not null,
  emailAdres varchar(50) NOT NULL,
  password varchar(255) NOT NULL,
membersince date not null,
  actief tinyint NOT NULL default 1,
  KEY emailAdres(emailAdres)
);
INSERT INTO users(firstname,lastname,emailAdres,password,membersince) VALUES
('Moges', 'Retta','moges.ash@gmail.com','{bcrypt}$2a$10$3DPuiwzO.I2UYggelBe8NuCHdd7Jblz2cu8K0ZkkguQZYnCIA4u5O','2020-9-11');

grant insert,select on products to cursist;
grant insert,select on catagories to cursist;
grant insert,select,update on products to cursist;
grant insert,select on costs to cursist;
grant insert,select,update on cities to cursist;
grant insert,select,update on users to cursist;
