/**
 * Faker library for ArkTS - Provides various fake data generation utilities
 * Similar to faker-js but compliant with ArkTS specifications
 */

/**
 * Unsplash image data interface
 */
export interface UnsplashImageData {
  id: string;
  url: string;
  thumbnailUrl: string;
  width: number;
  height: number;
  category: string;
  keywords: string[];
  orientation: 'landscape' | 'portrait' | 'squarish';
  alt: string;
  downloadUrl: string;
  authorName: string;
  authorUrl: string;
  description: string;
}

/**
 * Random number generator utility
 */
class Random {
  private static seed: number = Date.now();

  /**
   * Set random seed for deterministic results
   */
  static setSeed(newSeed: number): void {
    Random.seed = newSeed;
  }

  /**
   * Generate random number between min and max (inclusive)
   */
  static number(min: number = 0, max: number = 100): number {
    Random.seed = (Random.seed * 9301 + 49297) % 233280;
    const rnd = Random.seed / 233280;
    return Math.floor(rnd * (max - min + 1)) + min;
  }

  /**
   * Generate random boolean
   */
  static boolean(): boolean {
    return Random.number(0, 1) === 1;
  }

  /**
   * Pick random element from array
   */
  static arrayElement<T>(array: T[]): T {
    return array[Random.number(0, array.length - 1)];
  }

  /**
   * Shuffle array randomly
   */
  static shuffle<T>(array: T[]): T[] {
    const result = [...array];
    for (let i = result.length - 1; i > 0; i--) {
      const j = Random.number(0, i);
      let GeneratedDestructArray_1 = [result[j], result[i]];
      result[i] = GeneratedDestructArray_1[0];
      result[j] = GeneratedDestructArray_1[1];
    }
    return result;
  }
}

/**
 * Name generator utilities
 */
export class Name {
  private static readonly firstNames: string[] = [
    '张伟', '王芳', '李娜', '刘强', '陈静', '杨洋', '黄敏', '赵磊', '周杰', '吴娟',
    '徐伟', '孙丽', '马超', '朱军', '胡明', '郭娜', '何勇', '高静', '林峰', '罗敏'
  ];
  private static readonly lastNames: string[] = [
    '张', '王', '李', '刘', '陈', '杨', '黄', '赵', '周', '吴',
    '徐', '孙', '马', '朱', '胡', '郭', '何', '高', '林', '罗'
  ];
  private static readonly englishFirstNames: string[] = [
    'James', 'Mary', 'John', 'Patricia', 'Robert', 'Jennifer', 'Michael', 'Linda',
    'William', 'Elizabeth', 'David', 'Barbara', 'Richard', 'Susan', 'Joseph', 'Jessica'
  ];
  private static readonly englishLastNames: string[] = [
    'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis',
    'Rodriguez', 'Martinez', 'Hernandez', 'Lopez', 'Gonzalez', 'Wilson', 'Anderson', 'Thomas'
  ];

  /**
   * Generate random Chinese full name
   */
  static chineseName(): string {
    return Random.arrayElement(Name.firstNames);
  }

  /**
   * Generate random English first name
   */
  static firstName(): string {
    return Random.arrayElement(Name.englishFirstNames);
  }

  /**
   * Generate random English last name
   */
  static lastName(): string {
    return Random.arrayElement(Name.englishLastNames);
  }

  /**
   * Generate random English full name
   */
  static fullName(): string {
    return `${Name.firstName()} ${Name.lastName()}`;
  }

  /**
   * Generate random title
   */
  static title(): string {
    const titles = ['Mr.', 'Ms.', 'Mrs.', 'Dr.', 'Prof.'];
    return Random.arrayElement(titles);
  }
}

/**
 * Address generator utilities
 */
export class Address {
  private static readonly cities: string[] = [
    '北京市', '上海市', '广州市', '深圳市', '杭州市', '南京市', '武汉市', '成都市',
    '西安市', '重庆市', '天津市', '苏州市', '长沙市', '沈阳市', '青岛市', '郑州市'
  ];
  private static readonly districts: string[] = [
    '朝阳区', '海淀区', '西城区', '东城区', '丰台区', '石景山区', '通州区', '昌平区',
    '大兴区', '顺义区', '房山区', '门头沟区', '平谷区', '怀柔区', '密云区', '延庆区'
  ];
  private static readonly streets: string[] = [
    '中山路', '解放路', '人民路', '建设路', '新华路', '友谊路', '光明路', '胜利路',
    '工业路', '环城路', '迎宾路', '文化路', '学府路', '商业街', '步行街', '科技路'
  ];

  /**
   * Generate random city name
   */
  static city(): string {
    return Random.arrayElement(Address.cities);
  }

  /**
   * Generate random district name
   */
  static district(): string {
    return Random.arrayElement(Address.districts);
  }

  /**
   * Generate random street name
   */
  static street(): string {
    return Random.arrayElement(Address.streets);
  }

  /**
   * Generate random street address
   */
  static streetAddress(): string {
    const streetNumber = Random.number(1, 999);
    return `${Address.street()}${streetNumber}号`;
  }

  /**
   * Generate random full address
   */
  static fullAddress(): string {
    return `${Address.city()}${Address.district()}${Address.streetAddress()}`;
  }

  /**
   * Generate random zip code
   */
  static zipCode(): string {
    return Random.number(100000, 999999).toString();
  }
}

/**
 * Phone number generator utilities
 */
export class Phone {
  private static readonly mobilePrefixes: string[] = [
    '130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
    '150', '151', '152', '153', '155', '156', '157', '158', '159',
    '180', '181', '182', '183', '184', '185', '186', '187', '188', '189'
  ];

  /**
   * Generate random mobile phone number
   */
  static mobile(): string {
    const prefix = Random.arrayElement(Phone.mobilePrefixes);
    const suffix = Random.number(10000000, 99999999);
    return `${prefix}${suffix}`;
  }

  /**
   * Generate random landline phone number
   */
  static landline(): string {
    const areaCode = Random.number(10, 999).toString().padStart(4, '0');
    const number = Random.number(10000000, 99999999);
    return `${areaCode}-${number}`;
  }
}

/**
 * Internet-related data generator utilities
 */
export class Internet {
  private static readonly domains: string[] = [
    'gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com', '163.com', 'qq.com',
    'sina.com', 'sohu.com', 'example.com', 'test.com'
  ];
  private static readonly tlds: string[] = [
    '.com', '.org', '.net', '.edu', '.gov', '.cn', '.io', '.co'
  ];

  /**
   * Generate random email address
   */
  static email(): string {
    const username = Name.firstName().toLowerCase() + Random.number(1, 999);
    const domain = Random.arrayElement(Internet.domains);
    return `${username}@${domain}`;
  }

  /**
   * Generate random username
   */
  static userName(): string {
    const name = Name.firstName().toLowerCase();
    const number = Random.number(1, 9999);
    return `${name}${number}`;
  }

  /**
   * Generate random URL
   */
  static url(): string {
    const protocol = Random.arrayElement(['http', 'https']);
    const subdomain = Random.arrayElement(['www', 'api', 'app', 'dev']);
    const domain = Name.firstName().toLowerCase();
    const tld = Random.arrayElement(Internet.tlds);
    return `${protocol}://${subdomain}.${domain}${tld}`;
  }

  /**
   * Generate random IP address
   */
  static ip(): string {
    const parts: number[] = [];
    for (let i = 0; i < 4; i++) {
      parts.push(Random.number(1, 255));
    }
    return parts.join('.');
  }

  /**
   * Generate random MAC address
   */
  static mac(): string {
    const parts: string[] = [];
    for (let i = 0; i < 6; i++) {
      parts.push(Random.number(0, 255).toString(16).padStart(2, '0'));
    }
    return parts.join(':');
  }
}

/**
 * Lorem ipsum text generator utilities
 */
export class Lorem {
  private static readonly wordsList: string[] = [
    'lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur', 'adipiscing', 'elit',
    'sed', 'do', 'eiusmod', 'tempor', 'incididunt', 'ut', 'labore', 'et', 'dolore',
    'magna', 'aliqua', 'enim', 'ad', 'minim', 'veniam', 'quis', 'nostrud',
    'exercitation', 'ullamco', 'laboris', 'nisi', 'aliquip', 'ex', 'ea', 'commodo',
    'consequat', 'duis', 'aute', 'irure', 'in', 'reprehenderit', 'voluptate',
    'velit', 'esse', 'cillum', 'fugiat', 'nulla', 'pariatur', 'excepteur', 'sint',
    'occaecat', 'cupidatat', 'non', 'proident', 'sunt', 'culpa', 'qui', 'officia',
    'deserunt', 'mollit', 'anim', 'id', 'est', 'laborum'
  ];

  /**
   * Generate random word
   */
  static word(): string {
    return Random.arrayElement(Lorem.wordsList);
  }

  /**
   * Generate multiple random words
   */
  static multipleWords(count: number = 3): string {
    const result: string[] = [];
    for (let i = 0; i < count; i++) {
      result.push(Lorem.word());
    }
    return result.join(' ');
  }

  /**
   * Generate random sentence
   */
  static sentence(wordCount: number = Random.number(4, 18)): string {
    const words = Lorem.multipleWords(wordCount);
    return words.charAt(0).toUpperCase() + words.slice(1) + '.';
  }

  /**
   * Generate random paragraph
   */
  static paragraph(sentenceCount: number = Random.number(3, 6)): string {
    const sentences: string[] = [];
    for (let i = 0; i < sentenceCount; i++) {
      sentences.push(Lorem.sentence());
    }
    return sentences.join(' ');
  }

  /**
   * Generate multiple paragraphs
   */
  static paragraphs(count: number = 3): string {
    const result: string[] = [];
    for (let i = 0; i < count; i++) {
      result.push(Lorem.paragraph());
    }
    return result.join('\n\n');
  }
}

/**
 * Date and time generator utilities
 */
export class DateTime {
  /**
   * Generate random date in the past
   */
  static past(years: number = 1): Date {
    const now = new Date();
    const pastTime = now.getTime() - (Random.number(0, years * 365 * 24 * 60 * 60 * 1000));
    return new Date(pastTime);
  }

  /**
   * Generate random date in the future
   */
  static future(years: number = 1): Date {
    const now = new Date();
    const futureTime = now.getTime() + (Random.number(0, years * 365 * 24 * 60 * 60 * 1000));
    return new Date(futureTime);
  }

  /**
   * Generate random date between two dates
   */
  static between(from: Date, to: Date): Date {
    const fromTime = from.getTime();
    const toTime = to.getTime();
    const randomTime = Random.number(fromTime, toTime);
    return new Date(randomTime);
  }

  /**
   * Generate random timestamp
   */
  static timestamp(): number {
    return DateTime.past().getTime();
  }
}

/**
 * Number generator utilities
 */
export class Numbers {
  /**
   * Generate random integer
   */
  static int(min: number = 0, max: number = 999): number {
    return Random.number(min, max);
  }

  /**
   * Generate random float
   */
  static float(min: number = 0, max: number = 999, precision: number = 2): number {
    const value = Math.random() * (max - min) + min;
    return Number(value.toFixed(precision));
  }

  /**
   * Generate random percentage
   */
  static percentage(): string {
    return `${Random.number(0, 100)}%`;
  }

  /**
   * Generate random currency amount
   */
  static currency(min: number = 1, max: number = 10000): string {
    const amount = Numbers.float(min, max, 2);
    return `¥${amount.toFixed(2)}`;
  }
}

/**
 * String-related generator utilities
 */
interface GeneratedTypeLiteralInterface_5 {
  length?: number;
  casing?: 'lower' | 'upper';
  prefix?: boolean;
}

interface AlphaOption{
   length?: number; casing?: 'lower' | 'upper' | 'mixed'; bannedChars?: string
}


interface GeneratedTypeLiteralInterface_1 {
  allowLeadingZeros?: boolean;
}

export class Strings {
  private static readonly LOWER = 'abcdefghijklmnopqrstuvwxyz';
  private static readonly UPPER = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  private static readonly DIGITS = '0123456789';
  private static readonly HEX_LOWER = '0123456789abcdef';
  private static readonly HEX_UPPER = '0123456789ABCDEF';
  private static readonly OCTAL = '01234567';
  private static readonly BINARY = '01';
  private static readonly SYMBOLS = "!@#$%^&*()[]{}<>?/|~+-=_:;,.";
  private static readonly DEFAULT_SAMPLE = Strings.LOWER + Strings.UPPER + Strings.DIGITS;

  private static pick(chars: string): string {
    return chars.charAt(Random.number(0, chars.length - 1));
  }

  private static sanitizeCharset(chars: string, banned?: string): string {
    if (!banned || banned.length === 0) return chars;
    const bannedSet = new Set<string>();
    for (let i = 0; i < banned.length; i++) {
      bannedSet.add(banned.charAt(i));
    }
    let result = '';
    for (let i = 0; i < chars.length; i++) {
      const c = chars.charAt(i);
      if (!bannedSet.has(c)) result += c;
    }
    return result;
  }

  /**
   * Generate alphabetic string
   */
  static alpha(options?:AlphaOption): string {
    const length = options?.length ?? 10;
    const casing = options?.casing ?? 'lower';
    let pool = casing === 'lower' ? Strings.LOWER : (casing === 'upper' ? Strings.UPPER : (Strings.LOWER + Strings.UPPER));
    pool = Strings.sanitizeCharset(pool, options?.bannedChars);
    if (!pool || pool.length === 0) {
      throw new Error('alpha(): character pool is empty after applying options');
    }
    let out = '';
    for (let i = 0; i < length; i++) out += Strings.pick(pool);
    return out;
  }

  /**
   * Generate alphanumeric string
   */
  static alphanumeric(options?:AlphaOption): string {
    const length = options?.length ?? 10;
    const casing = options?.casing ?? 'mixed';
    let letters = casing === 'lower' ? Strings.LOWER : (casing === 'upper' ? Strings.UPPER : (Strings.LOWER + Strings.UPPER));
    let pool = letters + Strings.DIGITS;
    pool = Strings.sanitizeCharset(pool, options?.bannedChars);
    if (!pool || pool.length === 0) {
      throw new Error('alphanumeric(): character pool is empty after applying options');
    }
    let out = '';
    for (let i = 0; i < length; i++) out += Strings.pick(pool);
    return out;
  }

  /**
   * Generate numeric string
   */
  static numeric(length: number = 10, options?: GeneratedTypeLiteralInterface_1): string {
    const allowLeadingZeros = options?.allowLeadingZeros ?? true;
    if (length <= 0) return '';
    let out = '';
    if (!allowLeadingZeros) {
      // First digit cannot be 0; if length is 1, return single non-zero digit
      const firstPool = '123456789';
      out += Strings.pick(firstPool);
      for (let i = 1; i < length; i++) out += Strings.pick(Strings.DIGITS);
    } else {
      for (let i = 0; i < length; i++) out += Strings.pick(Strings.DIGITS);
    }
    return out;
  }

  /**
   * Generate binary string
   */
  static binary(length: number = 8): string {
    let out = '';
    for (let i = 0; i < length; i++) out += Strings.pick(Strings.BINARY);
    return out;
  }

  /**
   * Generate octal string
   */
  static octal(length: number = 8): string {
    let out = '';
    for (let i = 0; i < length; i++) out += Strings.pick(Strings.OCTAL);
    return out;
  }

  /**
   * Generate hexadecimal string
   */
  static hexadecimal(options?: GeneratedTypeLiteralInterface_5): string {
    const length = options?.length ?? 10;
    const casing = options?.casing ?? 'lower';
    const prefix = options?.prefix ?? false;
    const pool = casing === 'lower' ? Strings.HEX_LOWER : Strings.HEX_UPPER;
    let out = '';
    for (let i = 0; i < length; i++) out += Strings.pick(pool);
    return prefix ? '0x' + out : out;
  }

  /**
   * Generate string from custom characters
   */
  static fromCharacters(chars: string | string[], length: number = 1): string {
    if (typeof chars === 'string') {
      let out = '';
      for (let i = 0; i < length; i++) out += Strings.pick(chars);
      return out;
    } else {
      let out = '';
      for (let i = 0; i < length; i++) out += Random.arrayElement(chars);
      return out;
    }
  }

  /**
   * Generate a random sample string using a default safe character set
   */
  static sample(length: number = 10, chars?: string): string {
    const pool = chars && chars.length > 0 ? chars : Strings.DEFAULT_SAMPLE;
    let out = '';
    for (let i = 0; i < length; i++) out += Strings.pick(pool);
    return out;
  }

  /**
   * Pick a random symbol character
   */
  static symbol(): string {
    return Strings.pick(Strings.SYMBOLS);
  }

  /**
   * Generate nanoid (URL-friendly) id
   */
  static nanoid(length: number = 21, alphabet?: string): string {
    const pool = alphabet && alphabet.length > 0 ? alphabet : (Strings.LOWER + Strings.UPPER + Strings.DIGITS + '_-');
    let out = '';
    for (let i = 0; i < length; i++) out += Strings.pick(pool);
    return out;
  }

  /**
   * Generate UUID v4
   */
  static uuid(): string {
    const hex = Strings.HEX_LOWER;
    const chars: string[] = [];
    for (let i = 0; i < 32; i++) chars.push(hex.charAt(Random.number(0, 15)));
    // version 4
    chars[12] = '4';
    // variant 10xx
    const variants = ['8', '9', 'a', 'b'];
    chars[16] = variants[Random.number(0, variants.length - 1)];
    return `${chars.slice(0, 8).join('')}-${chars.slice(8, 12).join('')}-${chars.slice(12, 16).join('')}-${chars.slice(16, 20).join('')}-${chars.slice(20).join('')}`;
  }


  static encodeBase32(num: number, len: number): string {
    const BASE32 = '0123456789ABCDEFGHJKMNPQRSTVWXYZ';
    let out = '';
    while (len-- > 0) {
      out = BASE32.charAt(num % 32) + out;
      num = Math.floor(num / 32);
    }
    return out;
  }

  /**
   * Generate ULID (Universally Unique Lexicographically Sortable Identifier)
   */
  static ulid(date?: number): string {
    const BASE32 = '0123456789ABCDEFGHJKMNPQRSTVWXYZ';


    const time = (typeof date === 'number' ? date : Date.now()) >>> 0; // lower 32 bits
    const high = Math.floor(((typeof date === 'number' ? date : Date.now()) / 0x100000000));
    // ULID timestamp is 48 bits -> split into high (16 bits) and low (32 bits)
    const timePart = Strings.encodeBase32(high, 2) + Strings.encodeBase32(time, 8);

    // 80 bits of randomness -> 16 chars base32
    let randPart = '';
    for (let i = 0; i < 16; i++) randPart += BASE32.charAt(Random.number(0, 31));
    return timePart + randPart;
  }
}

/**
 * Color generator utilities
 */
export class Color {
  /**
   * Generate random hex color
   */
  static hex(): string {
    const color = Random.number(0, 16777215).toString(16).padStart(6, '0');
    return `#${color}`;
  }

  /**
   * Generate random RGB color
   */
  static rgb(): string {
    const r = Random.number(0, 255);
    const g = Random.number(0, 255);
    const b = Random.number(0, 255);
    return `rgb(${r}, ${g}, ${b})`;
  }

  /**
   * Generate random RGBA color
   */
  static rgba(): string {
    const r = Random.number(0, 255);
    const g = Random.number(0, 255);
    const b = Random.number(0, 255);
    const a = Numbers.float(0, 1, 2);
    return `rgba(${r}, ${g}, ${b}, ${a})`;
  }
}

/**
 * Image generator utilities
 */
export class Image {
  private static readonly unsplashCategories: string[] = [
    'nature', 'people', 'technology', 'animals', 'food', 'travel', 'architecture',
    'business', 'fashion', 'film', 'health', 'interiors', 'street-photography',
    'textures-patterns', 'wallpapers', 'current-events', 'experimental', 'sports'
  ];
  private static readonly unsplashKeywordsList: string[] = [
    'landscape', 'portrait', 'city', 'ocean', 'mountain', 'forest', 'sunset', 'flower',
    'building', 'car', 'computer', 'phone', 'coffee', 'book', 'dog', 'cat', 'bird',
    'office', 'home', 'street', 'bridge', 'sky', 'cloud', 'tree', 'river', 'beach'
  ];

  /**
   * Generate random image URL using Picsum (Lorem Picsum)
   */
  static url(width: number = 640, height: number = 480): string {
    return `https://picsum.photos/${width}/${height}?random=${Random.number(1, 1000)}`;
  }

  /**
   * Generate avatar image URL
   */
  static avatar(): string {
    const seed = Random.number(1, 1000);
    return `https://i.pravatar.cc/150?img=${seed}`;
  }

  /**
   * Generate Unsplash image URL
   */
  static unsplash(width: number = 640, height: number = 480, category?: string): string {
    const selectedCategory = category || Random.arrayElement(Image.unsplashCategories);
    return `https://source.unsplash.com/${width}x${height}/?${selectedCategory}`;
  }

  /**
   * Generate Unsplash image URL with specific keyword
   */
  static unsplashKeyword(width: number = 640, height: number = 480, keyword?: string): string {
    const selectedKeyword = keyword || Random.arrayElement(Image.unsplashKeywordsList);
    return `https://source.unsplash.com/${width}x${height}/?${selectedKeyword}`;
  }

  /**
   * Generate Unsplash image URL with multiple keywords
   */
  static unsplashMultipleKeywords(width: number = 640, height: number = 480, keywords?: string[]): string {
    const selectedKeywords = keywords || Random.shuffle(Image.unsplashKeywordsList).slice(0, Random.number(2, 4));
    const keywordString = selectedKeywords.join(',');
    return `https://source.unsplash.com/${width}x${height}/?${keywordString}`;
  }

  /**
   * Generate Unsplash collection image URL
   */
  static unsplashCollection(width: number = 640, height: number = 480, collectionId?: string): string {
    const defaultCollections = ['1065976', '1114848', '1342877', '1973049', '2044163', '2612563'];
    const selectedCollection = collectionId || Random.arrayElement(defaultCollections);
    return `https://source.unsplash.com/collection/${selectedCollection}/${width}x${height}`;
  }

  /**
   * Generate Unsplash user photo URL
   */
  static unsplashUser(width: number = 640, height: number = 480, username?: string): string {
    const popularUsers = ['adigold1', 'nasa', 'neom', 'spacex', 'instagram', 'yancymin', 'markusspiske'];
    const selectedUser = username || Random.arrayElement(popularUsers);
    return `https://source.unsplash.com/user/${selectedUser}/${width}x${height}`;
  }

  /**
   * Generate featured Unsplash image URL
   */
  static unsplashFeatured(width: number = 640, height: number = 480): string {
    return `https://source.unsplash.com/featured/${width}x${height}`;
  }

  /**
   * Generate daily Unsplash image URL
   */
  static unsplashDaily(width: number = 640, height: number = 480): string {
    return `https://source.unsplash.com/daily/${width}x${height}`;
  }

  /**
   * Generate Unsplash image URL with specific photo ID
   */
  static unsplashPhoto(photoId: string, width: number = 640, height: number = 480): string {
    return `https://source.unsplash.com/${photoId}/${width}x${height}`;
  }

  /**
   * Generate random Unsplash image from a specific orientation
   */
  static unsplashOrientation(width: number = 640, height: number = 480,
    orientation: 'landscape' | 'portrait' | 'squarish' = 'landscape'): string {
    const category = Random.arrayElement(Image.unsplashCategories);
    return `https://source.unsplash.com/${width}x${height}/?${category}&orientation=${orientation}`;
  }

  /**
   * Get all available Unsplash categories
   */
  static getUnsplashCategories(): string[] {
    return [...Image.unsplashCategories];
  }

  /**
   * Get all available Unsplash keywords
   */
  static getUnsplashKeywords(): string[] {
    return [...Image.unsplashKeywordsList];
  }

  /**
   * Generate a complete image data object with Unsplash metadata
   */
  static unsplashImageData(width: number = 640, height: number = 480): UnsplashImageData {
    const category = Random.arrayElement(Image.unsplashCategories);
    const keywords = Random.shuffle(Image.unsplashKeywordsList).slice(0, Random.number(2, 5));
    const orientation = Random.arrayElement(['landscape', 'portrait', 'squarish']) as 'landscape' | 'portrait' | 'squarish';

    return {
      id: `unsplash_${Random.number(100000, 999999)}`,
      url: Image.unsplash(width, height, category),
      thumbnailUrl: Image.unsplash(Math.floor(width / 4), Math.floor(height / 4), category),
      width: width,
      height: height,
      category: category,
      keywords: keywords,
      orientation: orientation,
      alt: `${category} image with ${keywords.join(', ')}`,
      downloadUrl: `https://unsplash.com/photos/download?id=${Random.number(100000, 999999)}`,
      authorName: Random.arrayElement(['John Doe', 'Jane Smith', 'Alex Johnson', 'Maria Garcia', 'David Chen']),
      authorUrl: `https://unsplash.com/@user${Random.number(100, 999)}`,
      description: `Beautiful ${category} photograph featuring ${keywords.slice(0, 2).join(' and ')}`
    };
  }
}

/**
 * Commerce-related data generator utilities
 */
export class Commerce {
  private static readonly productNames: string[] = [
    '苹果', '香蕉', '橙子', '葡萄', '草莓', '蓝莓', '樱桃', '桃子', '梨', '柠檬',
    '手机', '电脑', '平板', '耳机', '音箱', '键盘', '鼠标', '显示器', '充电器', '数据线'
  ];
  private static readonly departments: string[] = [
    '电子产品', '服装鞋包', '家居用品', '美妆护肤', '食品饮料', '图书音像', '运动户外', '母婴用品'
  ];

  /**
   * Generate random product name
   */
  static productName(): string {
    return Random.arrayElement(Commerce.productNames);
  }

  /**
   * Generate random department
   */
  static department(): string {
    return Random.arrayElement(Commerce.departments);
  }

  /**
   * Generate random price
   */
  static price(min: number = 1, max: number = 1000): string {
    return Numbers.currency(min, max);
  }
}

/**
 * Company-related data generator utilities
 */
export class Company {
  private static readonly companyNames: string[] = [
    '阿里巴巴', '腾讯', '百度', '字节跳动', '美团', '京东', '网易', '滴滴', '小米', '华为',
    '中国移动', '中国电信', '中国联通', '工商银行', '建设银行', '农业银行', '中国银行'
  ];
  private static readonly companySuffixes: string[] = [
    '有限公司', '股份有限公司', '集团', '科技有限公司', '网络科技有限公司'
  ];

  /**
   * Generate random company name
   */
  static companyName(): string {
    return Random.arrayElement(Company.companyNames);
  }

  /**
   * Generate random company suffix
   */
  static suffix(): string {
    return Random.arrayElement(Company.companySuffixes);
  }

  /**
   * Generate random full company name
   */
  static fullName(): string {
    return `${Company.companyName()}${Company.suffix()}`;
  }
}

/**
 * Main Faker class that aggregates all utilities
 */
export class Faker {
  static readonly names = Name;
  static readonly address = Address;
  static readonly phone = Phone;
  static readonly internet = Internet;
  static readonly lorem = Lorem;
  static readonly dateTime = DateTime;
  static readonly numbers = Numbers;
  static readonly string = Strings;
  static readonly color = Color;
  static readonly image = Image;
  static readonly commerce = Commerce;
  static readonly company = Company;
  static readonly random = Random;

  /**
   * Set seed for deterministic results
   */
  static seed(value: number): void {
    Random.setSeed(value);
  }
}

// Export default faker instance
export default Faker;