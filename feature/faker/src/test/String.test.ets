import { describe, it, expect } from '@ohos/hypium';
import Faker, { Strings } from '../main/ets/faker';

export default function stringTest() {
    describe('Strings Generator', () => {
        it('alpha should generate letters with length', () => {
            const s = Strings.alpha({ length: 12, casing: 'lower' });
            expect(typeof s).assertEqual('string');
            expect(s.length).assertEqual(12);
            expect(/^[a-z]+$/.test(s)).assertTrue();
        });

        it('alphanumeric should include letters and digits', () => {
            const s = Strings.alphanumeric({ length: 20 });
            expect(s.length).assertEqual(20);
            expect(/^[A-Za-z0-9]+$/.test(s)).assertTrue();
        });

        it('numeric should control leading zeros', () => {
            const s1 = Strings.numeric(8);
            const s2 = Strings.numeric(8, { allowLeadingZeros: false });
            expect(/^[0-9]{8}$/.test(s1)).assertTrue();
            expect(/^[1-9][0-9]{7}$/.test(s2)).assertTrue();
        });

        it('hexadecimal should support prefix and casing', () => {
            const h1 = Strings.hexadecimal({ length: 6, prefix: true, casing: 'lower' });
            const h2 = Strings.hexadecimal({ length: 6, prefix: false, casing: 'upper' });
            expect(/^0x[0-9a-f]{6}$/.test(h1)).assertTrue();
            expect(/^[0-9A-F]{6}$/.test(h2)).assertTrue();
        });

        it('uuid should be valid v4 format', () => {
            const id = Strings.uuid();
            expect(/^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/.test(id)).assertTrue();
        });

        it('ulid should be 26 chars Crockford base32', () => {
            const id = Strings.ulid();
            expect(id.length).assertEqual(26);
            expect(/^[0-9A-HJKMNP-TV-Z]{26}$/.test(id)).assertTrue();
        });

        it('fromCharacters should use provided pool', () => {
            const s = Strings.fromCharacters('ABC', 5);
            expect(/^[ABC]{5}$/.test(s)).assertTrue();
        });

        it('symbol should return one symbol', () => {
            const sym = Strings.symbol();
            expect(typeof sym).assertEqual('string');
            expect(sym.length).assertEqual(1);
        });

        it('binary and octal should use correct digits', () => {
            const b = Strings.binary(16);
            const o = Strings.octal(12);
            expect(/^[01]{16}$/.test(b)).assertTrue();
            expect(/^[0-7]{12}$/.test(o)).assertTrue();
        });

        it('nanoid should generate with default length', () => {
            const id = Strings.nanoid();
            expect(typeof id).assertEqual('string');
            expect(id.length).assertEqual(21);
        });
    });
}
