import com.softdev.*
import org.joda.time.LocalDateTime

class BootStrap {

    def init = { servletContext ->
        new UserRole(title: 'Admin').save()
    	new UserRole(title: 'Teacher').save()
    	new UserRole(title: 'Maid').save()
    	new UserRole(title: 'Student').save()

    	new User(name: 'นางสาวลลิตวดี ดำยศ', telNum: '0805415438', barcode: '5610110454', username: 'prae', password: '1234', type: UserRole.findByTitle('Admin')).save()
    	new User(name: 'นายจริย์วัฒน์ หิรัญวิริยะ ', telNum: '0805414327', barcode: '5610110065', username: 'tul', password: '1234', type: UserRole.findByTitle('Student')).save()
    	new User(name: 'นายวรโชติ เสถียรวงศ์นุษา', telNum: '0805214327', barcode: '5610110467', username: 'soon', password: '1234', type: UserRole.findByTitle('Maid')).save()
    	new User(name: 'นางสาววาสิฏฐี ลีละศุภกุล', telNum: '0802114327', barcode: '5610110493', username: 'aun', password: '1234', type: UserRole.findByTitle('Teacher')).save()
        new User(name: 'นางสาววิลาสินี นวลงาม ', telNum: '0800093270', barcode: '5610110503', username: 'prae2', password: '1234', type: UserRole.findByTitle('Student')).save()
    	new User(name: 'Joi ', telNum: '0800093270', barcode: '5610110456', password: '1234', username: 'joi', type: UserRole.findByTitle('Student')).save()
    	

    	def i1 = new Item(title: 'ปากกาไวท์บอร์ท ดำ', barcode: 'ITEM0001', remaining: 10, unit: 'ด้าม', description: 'รายละเอียด').save()
    	def i2 = new Item(title: 'ปากกาไวท์บอร์ท น้ำเงิน', barcode: 'ITEM0002', remaining: 5, unit: 'ด้าม', description: 'รายละเอียด').save()
    	def i3 = new Item(title: 'ปากกาไฮไลท์', barcode: 'ITEM0003', remaining: 6, unit: 'ด้าม', description: 'รายละเอียด').save()
    	def i4 = new Item(title: 'ปากกาลูกลื่น ธรรมดา (สีแดง)', barcode: 'ITEM0004', remaining: 14, unit: 'ด้าม', description: 'รายละเอียด').save()
        def i5 = new Item(title: 'ปากกาลูกลื่น (สีดำ)', barcode: 'ITEM0005', remaining: 7, unit: 'ด้าม', description: 'รายละเอียด').save()
        def i6 = new Item(title: 'ปากกาลูกลื่น (สีน้ำเงิน)', barcode: 'ITEM0006', remaining: 3, unit: 'ด้าม', description: 'รายละเอียด').save()
        def i7 = new Item(title: 'มีด คัตเตอร์ cutter', barcode: 'ITEM0007', remaining: 100, unit: 'เล่ม', description: 'รายละเอียด').save()
        def i8 = new Item(title: 'ริบบิ้น(ผูกโบว์)', barcode: 'ITEM0008', remaining: 150, unit: 'ม้วน', description: 'รายละเอียด').save()
        def i9 = new Item(title: 'ลวดเย็บกระดาษ 1/2', barcode: 'ITEM0009', remaining: 18, unit: 'อัน', description: 'รายละเอียด').save()
        def i10 = new Item(title: 'โอพีเทป 2 นิ้ว  สีน้ำตาล (ติดลังได้)', barcode: 'ITEM0010', remaining: 20, unit: 'ม้วน', description: 'รายละเอียด').save()
        def i11 = new Item(title: 'ชั้นวางของ ไมโครแร็ค', barcode: 'ITEM0011', remaining: 30, unit: 'ม้วน', description: 'รายละเอียด').save()
        def i12 = new Item(title: 'สก๊อตเทป 3 นิ้ว', barcode: 'ITEM0012', remaining: 10, unit: 'ม้วน', description: 'รายละเอียด').save()
        def i13 = new Item(title: 'Max ลวดเย็บกระดาษ No.35', barcode: 'ITEM0013', remaining: 20, unit: 'อัน', description: 'รายละเอียด').save()
        def i14 = new Item(title: 'CD-RW พร้อมกล่องใส่', barcode: 'ITEM0014', remaining: 8, unit: 'แผ่น', description: 'รายละเอียด').save()
        def i15 = new Item(title: 'ดีวีดี DVD-RW พร้อมกล่องใส่', barcode: 'ITEM0015', remaining: 90, unit: 'แผ่น', description: 'รายละเอียด').save()
        def i16 = new Item(title: 'ISCIT 2003 CD + กล่อง', barcode: 'ITEM0016', remaining: 45, unit: 'แผ่น', description: 'รายละเอียด').save()
        def i17 = new Item(title: 'ซีดี อาร์ CD-R พร้อมกล่องใส่', barcode: 'ITEM0017', remaining: 30, unit: 'แผ่น', description: 'รายละเอียด').save()
        def i18 = new Item(title: 'แผ่น floppy disk', barcode: 'ITEM0018', remaining: 20, unit: 'กล่อง', description: 'รายละเอียด').save()
        def i19 = new Item(title: 'jcssc 2015', barcode: 'ITEM0019', remaining: 60, unit: 'กล่อง', description: 'รายละเอียด').save()
        def i20 = new Item(title: 'หัว laser เลเซอร์', barcode: 'ITEM0020', remaining: 50, unit: 'กล่อง', description: 'รายละเอียด').save()

    	new TransactionType(title: 'เบิก').save()
    	new TransactionType(title: 'ยืม').save()
        new TransactionType(title: 'ถอน').save()

    	// transaction
    	def t1 = new Transaction(date: new Date('11/21/2015'), 
    							 isApprove: false, 
    							 type: TransactionType.findByTitle('เบิก'),
    							 user: User.findByBarcode('5610110454'),
                                 description: 'อธิบายการยืมของ 5610110454').save()
    	def t2 = new Transaction(date: new LocalDateTime(), 
    							 isApprove: true, 
    							 type: TransactionType.findByTitle('เบิก'),
    							 user: User.findByBarcode('5610110503'),
                                 description: 'อธิบายการยืมของ 5610110503').save()
    	def t3 = new Transaction(date: new Date('12/10/2015'), 
    							 isApprove: true, 
    							 type: TransactionType.findByTitle('ยืม'),
    							 user: User.findByBarcode('5610110467'),
                                 description: 'อธิบายการยืมของ 5610110467').save()
    	

    	def it1 = new TransactionItemShips(transaction: t1, item: i1, amount: 1).save()
    	def it2 = new TransactionItemShips(transaction: t2, item: i5, amount: 2).save()
    	def it3 = new TransactionItemShips(transaction: t1, item: i4, amount: 5).save()
    	def it4 = new TransactionItemShips(transaction: t2, item: i2, amount: 3).save()
    	def it5 = new TransactionItemShips(transaction: t3, item: i5, amount: 4).save()    	
    	def it6 = new TransactionItemShips(transaction: t3, item: i1, amount: 8).save()
    	def it7 = new TransactionItemShips(transaction: t3, item: i2, amount: 1).save()


    }
    def destroy = {
    }
}
