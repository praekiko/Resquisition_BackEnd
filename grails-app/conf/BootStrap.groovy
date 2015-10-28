import com.softdev.*
import org.joda.time.LocalDateTime

class BootStrap {

    def init = { servletContext ->
        new UserRole(id: 1, title: 'Admin').save()
    	new UserRole(id: 2, title: 'Teacher').save()
    	new UserRole(id: 3, title: 'Maid').save()
    	new UserRole(id: 4, title: 'Student').save()

    	new User(id: 1, name: 'Prae', telNum: '0805415438', barcode: '5610110454', type: UserRole.findByTitle('Admin')).save()
    	new User(id: 2, name: 'Prae2', telNum: '0805414327', barcode: 'SN^12DASDA', type: UserRole.findByTitle('Student')).save()
    	new User(id: 3, name: 'Soon', telNum: '0805214327', barcode: 'SN^12DAXXA', type: UserRole.findByTitle('Maid')).save()
    	new User(id: 4, name: 'Tun', telNum: '0802114327', barcode: 'SN^12DA77A', type: UserRole.findByTitle('Teacher')).save()
    	new User(id: 5, name: 'Aun', telNum: '080009327', barcode: 'SN^122AXXA', type: UserRole.findByTitle('Student')).save()
    	

    	def i1 = new Item(id: 1, title: 'pen', barcode: '123Adashf', remaining: 50, description: 'ปากกานะ').save()
    	def i2 = new Item(id: 2, title: 'pencil', barcode: '1231234ashf', remaining: 5, description: 'ดินสอคะ').save()
    	def i3 = new Item(id: 3, title: 'notebook', barcode: '123Adas2hf', remaining: 15, description: 'สมุดจด').save()
    	def i4 = new Item(id: 4, title: 'paper', barcode: '123Adas555hf', remaining: 11, description: 'กระดาษ').save()
    	def i5 = new Item(id: 5, title: 'clock', barcode: '123A66dashf', remaining: 8, description: 'นาฬิกา').save()

    	new TransactionType(id: 1, title: 'เบิก').save()
    	new TransactionType(id: 2, title: 'ยืม').save()

    	// transaction
    	def t1 = new Transaction(id: 1, 
    							 date: new Date('11/21/2015'), 
    							 isApprove: false, 
    							 type: TransactionType.findByTitle('เบิก'),
    							 user: User.findByName('Prae'),
                                 description: 'อธิบายการยืมของ Prae').save()
    	def t2 = new Transaction(id: 2, 
    							 date: new LocalDateTime(), 
    							 isApprove: true, 
    							 type: TransactionType.findByTitle('เบิก'),
    							 user: User.findByName('Prae2'),
                                 description: 'อธิบายการยืมของ Prae2').save()
    	def t3 = new Transaction(id: 3, 
    							 date: new Date('12/10/2015'), 
    							 isApprove: true, 
    							 type: TransactionType.findByTitle('ยืม'),
    							 user: User.findByName('Zoon'),
                                 description: 'อธิบายการยืมของ (Zoon').save()
    	

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
