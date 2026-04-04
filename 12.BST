1. https://ideone.com/eT7Uih
bool isValidBST(vector<int> &order){
    for(int i=1;i<order.size();i++){
        if(order[i-1]>=order[i]) return false;
    }
    return true;
}

2. https://ideone.com/n2Yme4
int minVal(Node* root){
	Node* temp=root;
	if(temp==NULL) return -1;
	while(temp->left) temp=temp->left;
	return temp->data;
}

3. https://ideone.com/7inqNE
int findCeil(BinaryTreeNode<int> *node, int x){
    BinaryTreeNode<int> *temp=node;
    int ans=INT_MAX;
    while(temp){
        if(temp->data==x) return x;        
        if(temp->data>x&&temp->data<ans){ 
            ans=temp->data;
            temp=temp->left;
        }
        else temp=temp->right;
    }
    return ans==INT_MAX?-1:ans;
}

4. https://ideone.com/cqoD6Y
int findCeil(BinaryTreeNode<int> *node, int x){
    BinaryTreeNode<int> *temp=node;
    int ans=-1;
    while(temp){
        if(temp->data==x) return x;        
        else if(x>temp->data)  temp=temp->right;
        else{
            ans=temp->data;
            temp=temp->left;
        }
    }
    return ans;
}

5. https://ideone.com/naPyeG
int Floor(BinaryTreeNode<int> *node, int input)
{
	BinaryTreeNode<int> *temp=node;
    int ans=-1;
    while(temp){
        if(temp->data==input) return input;        
        else if(input<temp->data) temp=temp->left;
        else{
			ans=temp->data;
			temp=temp->right;
		}
    }
    return ans;
}

6. https://ideone.com/xeUlCj
node* kthsmallest(node* root,int &k)
{
	if(root==NULL)
	return NULL;
	
	node* left=kthsmallest(root->left,k);
	if(left!=NULL)
	return left;
	k--;
	if(k==0)
	return root;
	
	return kthsmallest(root->right,k);
}

7. https://ideone.com/9DMoCe
        void f(Node* root, int &k,int &ans){
        if(root==NULL) return ;
        f(root->right,k,ans);
        k--;
        if(k==0) ans=root->data;
        f(root->left,k,ans);
    }
    int kthLargest(Node *root, int K)
    {
        int ans=0;
        f(root,K,ans);
        return ans;
    }

8. https://ideone.com/SNVr8Y
node* kthlargest(node* root,int& k)
{
	if(root==NULL)
	return NULL;
	
	node* right=kthlargest(root->right,k);
	if(right!=NULL)
	return right;
	k--;
	
	if(k==0)
	return root;
	
	return kthlargest(root->left,k);
}

9. https://ideone.com/aiEEVE
int pre(TreeNode *root){
    if(root==NULL) return -1;
    while(root->right) root=root->right;
    return root->data;
}
int succ(TreeNode *root){
    if(root==NULL) return -1;
    while(root->left) root=root->left;
    return root->data;    
}
pair<int, int> predecessorSuccessor(TreeNode *root, int key)
{
    while(root){
        if(root->data==key){
            int p=pre(root->left),s=succ(root->right);
            return {p,s};
        }
        else if(root->data<key) root=root->right;
        else root=root->left;
    }
    return {-1,-1};
}

10. https://ideone.com/6B2o0j
pair<int, int> predecessorSuccessor(TreeNode *root, int key)
{
    TreeNode *temp=root;
    int pre=-1,succ=-1;
    while(temp){
        if(key<=temp->data){
            temp=temp->left;
        }
        else{
            pre=temp->data;
            temp=temp->right;
        }
    }
    temp=root;
    while(temp){
        if(key>=temp->data){
            temp=temp->right;
        }
        else{
            succ=temp->data;
            temp=temp->left; 
        }
    }
    return {pre,succ};
}

11. https://ideone.com/HiGc2v
class NodeVal{
    public:
    int mini,maxi,size;
    // NodeVal(){
        
    // }
    NodeVal(int mini,int maxi,int size){
        this->mini=mini;
        this->maxi=maxi;
        this->size=size;
    }
};
NodeVal f(TreeNode * root){
    if(root==NULL) return NodeVal(INT_MAX,INT_MIN,0);
    auto left=f(root->left);    
    auto right=f(root->right);
    if(root->data>left.maxi&&root->data<right.mini) return NodeVal(min(root->data,left.mini),max(root->data,right.maxi),left.size+right.size+1);
    return NodeVal(INT_MIN,INT_MAX,max(left.size,right.size));
}
int largestBST(TreeNode * root){
    return f(root).size;
}













































