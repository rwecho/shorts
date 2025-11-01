/**
 * Unit tests for the Faker library
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import Faker, { Name, Address, Phone, Internet, Lorem, DateTime, Numbers, Color, Commerce, Company } from '../main/ets/faker';

export default function fakerTest() {
    describe('Faker Library Tests', () => {

        describe('Name Generator', () => {
            it('should generate Chinese names', () => {
                const name = Name.chineseName();
                expect(typeof name).assertEqual('string');
                expect(name.length).assertLarger(0);
            });

            it('should generate English first names', () => {
                const firstName = Name.firstName();
                expect(typeof firstName).assertEqual('string');
                expect(firstName.length).assertLarger(0);
            });

            it('should generate English last names', () => {
                const lastName = Name.lastName();
                expect(typeof lastName).assertEqual('string');
                expect(lastName.length).assertLarger(0);
            });

            it('should generate full English names', () => {
                const fullName = Name.fullName();
                expect(typeof fullName).assertEqual('string');
                expect(fullName.indexOf(' ')).assertLarger(-1); // Should contain space
            });

            it('should generate titles', () => {
                const title = Name.title();
                expect(typeof title).assertEqual('string');
                expect(['Mr.', 'Ms.', 'Mrs.', 'Dr.', 'Prof.'].indexOf(title)).assertLarger(-1);
            });
        });

        describe('Address Generator', () => {
            it('should generate city names', () => {
                const city = Address.city();
                expect(typeof city).assertEqual('string');
                expect(city.length).assertLarger(0);
            });

            it('should generate street addresses', () => {
                const address = Address.streetAddress();
                expect(typeof address).assertEqual('string');
                expect(address.indexOf('号')).assertLarger(-1); // Should contain '号'
            });

            it('should generate full addresses', () => {
                const address = Address.fullAddress();
                expect(typeof address).assertEqual('string');
                expect(address.length).assertLarger(5); // Should be reasonably long
            });

            it('should generate zip codes', () => {
                const zipCode = Address.zipCode();
                expect(typeof zipCode).assertEqual('string');
                expect(zipCode.length).assertEqual(6); // Should be 6 digits
            });
        });

        describe('Phone Generator', () => {
            it('should generate mobile phone numbers', () => {
                const mobile = Phone.mobile();
                expect(typeof mobile).assertEqual('string');
                expect(mobile.length).assertEqual(11); // Chinese mobile numbers are 11 digits
            });

            it('should generate landline phone numbers', () => {
                const landline = Phone.landline();
                expect(typeof landline).assertEqual('string');
                expect(landline.indexOf('-')).assertLarger(-1); // Should contain dash
            });
        });

        describe('Internet Generator', () => {
            it('should generate email addresses', () => {
                const email = Internet.email();
                expect(typeof email).assertEqual('string');
                expect(email.indexOf('@')).assertLarger(-1); // Should contain @
            });

            it('should generate usernames', () => {
                const username = Internet.userName();
                expect(typeof username).assertEqual('string');
                expect(username.length).assertLarger(0);
            });

            it('should generate URLs', () => {
                const url = Internet.url();
                expect(typeof url).assertEqual('string');
                expect(url.startsWith('http')).assertTrue();
            });

            it('should generate IP addresses', () => {
                const ip = Internet.ip();
                expect(typeof ip).assertEqual('string');
                const parts = ip.split('.');
                expect(parts.length).assertEqual(4);
            });

            it('should generate MAC addresses', () => {
                const mac = Internet.mac();
                expect(typeof mac).assertEqual('string');
                const parts = mac.split(':');
                expect(parts.length).assertEqual(6);
            });
        });

        describe('Lorem Generator', () => {
            it('should generate single words', () => {
                const word = Lorem.word();
                expect(typeof word).assertEqual('string');
                expect(word.length).assertLarger(0);
            });

            it('should generate multiple words', () => {
                const words = Lorem.multipleWords(5);
                expect(typeof words).assertEqual('string');
                expect(words.split(' ').length).assertEqual(5);
            });

            it('should generate sentences', () => {
                const sentence = Lorem.sentence();
                expect(typeof sentence).assertEqual('string');
                expect(sentence.endsWith('.')).assertTrue();
            });

            it('should generate paragraphs', () => {
                const paragraph = Lorem.paragraph();
                expect(typeof paragraph).assertEqual('string');
                expect(paragraph.length).assertLarger(10);
            });
        });

        describe('DateTime Generator', () => {
            it('should generate past dates', () => {
                const pastDate = DateTime.past();
                expect(pastDate instanceof Date).assertTrue();
                expect(pastDate.getTime()).assertLess(Date.now());
            });

            it('should generate future dates', () => {
                const futureDate = DateTime.future();
                expect(futureDate instanceof Date).assertTrue();
                expect(futureDate.getTime()).assertLarger(Date.now());
            });

            it('should generate dates between two dates', () => {
                const start = new Date('2020-01-01');
                const end = new Date('2025-01-01');
                const betweenDate = DateTime.between(start, end);
                expect(betweenDate instanceof Date).assertTrue();
                expect(betweenDate.getTime()).assertLargerOrEqual(start.getTime());
                expect(betweenDate.getTime()).assertLessOrEqual(end.getTime());
            });

            it('should generate timestamps', () => {
                const timestamp = DateTime.timestamp();
                expect(typeof timestamp).assertEqual('number');
                expect(timestamp).assertLarger(0);
            });
        });

        describe('Numbers Generator', () => {
            it('should generate integers within range', () => {
                const num = Numbers.int(10, 20);
                expect(typeof num).assertEqual('number');
                expect(num).assertLargerOrEqual(10);
                expect(num).assertLessOrEqual(20);
                expect(Number.isInteger(num)).assertTrue();
            });

            it('should generate floats within range', () => {
                const num = Numbers.float(0, 100, 2);
                expect(typeof num).assertEqual('number');
                expect(num).assertLargerOrEqual(0);
                expect(num).assertLessOrEqual(100);
            });

            it('should generate percentages', () => {
                const percentage = Numbers.percentage();
                expect(typeof percentage).assertEqual('string');
                expect(percentage.endsWith('%')).assertTrue();
            });

            it('should generate currency amounts', () => {
                const currency = Numbers.currency();
                expect(typeof currency).assertEqual('string');
                expect(currency.startsWith('¥')).assertTrue();
            });
        });

        describe('Color Generator', () => {
            it('should generate hex colors', () => {
                const hex = Color.hex();
                expect(typeof hex).assertEqual('string');
                expect(hex.startsWith('#')).assertTrue();
                expect(hex.length).assertEqual(7);
            });

            it('should generate RGB colors', () => {
                const rgb = Color.rgb();
                expect(typeof rgb).assertEqual('string');
                expect(rgb.startsWith('rgb(')).assertTrue();
                expect(rgb.endsWith(')')).assertTrue();
            });

            it('should generate RGBA colors', () => {
                const rgba = Color.rgba();
                expect(typeof rgba).assertEqual('string');
                expect(rgba.startsWith('rgba(')).assertTrue();
                expect(rgba.endsWith(')')).assertTrue();
            });
        });

        describe('Commerce Generator', () => {
            it('should generate product names', () => {
                const productName = Commerce.productName();
                expect(typeof productName).assertEqual('string');
                expect(productName.length).assertLarger(0);
            });

            it('should generate departments', () => {
                const department = Commerce.department();
                expect(typeof department).assertEqual('string');
                expect(department.length).assertLarger(0);
            });

            it('should generate prices', () => {
                const price = Commerce.price();
                expect(typeof price).assertEqual('string');
                expect(price.startsWith('¥')).assertTrue();
            });
        });

        describe('Company Generator', () => {
            it('should generate company names', () => {
                const name = Company.companyName();
                expect(typeof name).assertEqual('string');
                expect(name.length).assertLarger(0);
            });

            it('should generate company suffixes', () => {
                const suffix = Company.suffix();
                expect(typeof suffix).assertEqual('string');
                expect(suffix.length).assertLarger(0);
            });

            it('should generate full company names', () => {
                const fullName = Company.fullName();
                expect(typeof fullName).assertEqual('string');
                expect(fullName.length).assertLarger(3);
            });
        });

        describe('Faker Main Class', () => {
            it('should provide access to all generators', () => {
                expect(typeof Faker.names).assertEqual('object');
                expect(typeof Faker.address).assertEqual('object');
                expect(typeof Faker.phone).assertEqual('object');
                expect(typeof Faker.internet).assertEqual('object');
                expect(typeof Faker.lorem).assertEqual('object');
                expect(typeof Faker.dateTime).assertEqual('object');
                expect(typeof Faker.numbers).assertEqual('object');
                expect(typeof Faker.color).assertEqual('object');
                expect(typeof Faker.commerce).assertEqual('object');
                expect(typeof Faker.company).assertEqual('object');
            });

            it('should support seed setting for reproducible results', () => {
                Faker.seed(12345);
                const name1 = Name.firstName();

                Faker.seed(12345);
                const name2 = Name.firstName();

                expect(name1).assertEqual(name2);
            });
        });

        describe('Random Utility', () => {
            it('should generate numbers within range', () => {
                for (let i = 0; i < 100; i++) {
                    const num = Faker.random.number(10, 20);
                    expect(num).assertLargerOrEqual(10);
                    expect(num).assertLessOrEqual(20);
                }
            });

            it('should generate booleans', () => {
                const bool = Faker.random.boolean();
                expect(typeof bool).assertEqual('boolean');
            });

            it('should pick array elements', () => {
                const array = ['a', 'b', 'c', 'd'];
                const element = Faker.random.arrayElement(array);
                expect(array.indexOf(element)).assertLarger(-1);
            });

            it('should shuffle arrays', () => {
                const original = [1, 2, 3, 4, 5];
                const shuffled = Faker.random.shuffle(original);
                expect(shuffled.length).assertEqual(original.length);
                // Check that all elements are still present
                for (const item of original) {
                    expect(shuffled.indexOf(item)).assertLarger(-1);
                }
            });
        });
    });
}